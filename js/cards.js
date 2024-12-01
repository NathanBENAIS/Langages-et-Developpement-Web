import { authInstance as a } from './config.js';

import { ToastManager } from "./toastManager.js";



const toast = new ToastManager();
function testOmekaUrls() {
    const baseUrl = 'http://localhost/omeka-s/api/';
    const user = JSON.parse(localStorage.getItem('user'));
    
    if (!user) {
        console.error('Aucun utilisateur connecté');
        return;
    }

    console.log('=== Test des URLs Omeka-S ===');
    
    // 1. Test de l'URL de base
    fetch(baseUrl)
        .then(response => response.json())
        .then(data => {
            console.log('1. URL de base:', baseUrl);
            console.log('Réponse:', data);
        })
        .catch(error => console.error('Erreur URL de base:', error));

    // 2. Test de recherche d'utilisateur
    const userUrl = `${baseUrl}items?property[0][property]=231&property[0][type]=eq&property[0][text]=${encodeURIComponent(user.email)}`;
    fetch(userUrl)
        .then(response => response.json())
        .then(data => {
            console.log('2. URL recherche utilisateur:', userUrl);
            console.log('Réponse:', data);
        })
        .catch(error => console.error('Erreur recherche utilisateur:', error));

    // 3. Test de recherche de trajets
    const trajetsUrl = `${baseUrl}items?resource_class_id[]=123&property[0][property]=247&property[0][type]=eq&property[0][text]=${user.id}`;
    fetch(trajetsUrl)
        .then(response => response.json())
        .then(data => {
            console.log('3. URL recherche trajets:', trajetsUrl);
            console.log('Réponse:', data);
        })
        .catch(error => console.error('Erreur recherche trajets:', error));

    // 4. Test des classes de ressources disponibles
    fetch(`${baseUrl}resource_classes`)
        .then(response => response.json())
        .then(data => {
            console.log('4. Classes de ressources disponibles:');
            console.log('Réponse:', data);
        })
        .catch(error => console.error('Erreur classes de ressources:', error));

    // 5. Test des propriétés disponibles
    fetch(`${baseUrl}properties`)
        .then(response => response.json())
        .then(data => {
            console.log('5. Propriétés disponibles:');
            console.log('Réponse:', data);
        })
        .catch(error => console.error('Erreur propriétés:', error));
}

// Fonction pour vérifier un item spécifique
function checkSpecificItem(itemId) {
    const baseUrl = 'http://localhost/omeka-s/api/';
    
    fetch(`${baseUrl}items/${itemId}`)
        .then(response => response.json())
        .then(data => {
            console.log(`Détails de l'item ${itemId}:`, data);
        })
        .catch(error => console.error(`Erreur item ${itemId}:`, error));
}

// Fonction pour vérifier les paramètres de l'API
function verifyApiConfig() {
    console.log('=== Configuration API ===');
    console.log('Base URL:', a.omk.api);
    console.log('Identifiant:', a.ident);
    console.log('Clé:', a.key);
}

// Ajoutez ceci à votre code existant
document.addEventListener('DOMContentLoaded', function() {
    verifyApiConfig();
    testOmekaUrls();
    
    // Test d'items spécifiques qui semblent être des trajets d'après vos logs
    [49, 50, 51, 52].forEach(itemId => checkSpecificItem(itemId));
});
// Fonction modifiée pour rechercher les trajets d'un utilisateur
// Fonction corrigée pour rechercher les trajets d'un utilisateur
// Fonction pour rechercher les trajets d'un utilisateur
function findUserTrajets(userId) {
    return new Promise((resolve, reject) => {
        try {
            // Requête simple pour récupérer tous les trajets
            const query = `resource_class_id[]=114`;  // ID de la classe Trajet
            
            console.log("Query construite:", query);
            
            a.omk.searchItems(query, (response) => {
                console.log("Réponse recherche initiale:", response);
                
                if (response && response.length > 0) {
                    // Filtrer les trajets pour l'utilisateur spécifique
                    const trajets = response.filter(item => {
                        if (item['@type'].includes('fup8:Trajet') && item['fup8:possedeTrajet']) {
                            try {
                                // Vérifier chaque entrée possedeTrajet
                                return item['fup8:possedeTrajet'].some(trajet => {
                                    const trajetData = JSON.parse(trajet['@value']);
                                    return trajetData['o:id'] === userId;
                                });
                            } catch (e) {
                                console.error("Erreur parsing trajet:", e);
                                return false;
                            }
                        }
                        return false;
                    });
                    
                    console.log("Trajets filtrés pour l'utilisateur:", trajets);
                    resolve(trajets);
                } else {
                    console.log("Aucun trajet trouvé");
                    resolve([]);
                }
            });
        } catch (error) {
            console.error("Erreur lors de la recherche des trajets:", error);
            reject(error);
        }
    });
}

// Fonction helper pour extraire les détails d'un trajet
// Fonction helper pour extraire les détails d'un trajet
function extractTrajetDetails(trajet) {
    console.log("Extraction des détails du trajet:", trajet);
    
    const details = {
        id: trajet['o:id'],
        nom: '',
        depart: '',
        arrivee: '',
        voiture: null,
        transportEnCommun: null,
        velo: null,
        marche: null
    };

    try {
        // Nom du trajet
        if (trajet['fup8:nomTrajet'] && trajet['fup8:nomTrajet'][0]) {
            details.nom = trajet['fup8:nomTrajet'][0]['@value'];
        }

        // Points de départ et d'arrivée
        if (trajet['fup8:pointDepart'] && trajet['fup8:pointDepart'][0]) {
            details.depart = trajet['fup8:pointDepart'][0]['@value'];
        }
        if (trajet['fup8:pointArrivee'] && trajet['fup8:pointArrivee'][0]) {
            details.arrivee = trajet['fup8:pointArrivee'][0]['@value'];
        }

        // Modes de transport
        if (trajet['fup8:contientVoiture'] && trajet['fup8:contientVoiture'][0]) {
            details.voiture = JSON.parse(trajet['fup8:contientVoiture'][0]['@value']);
        }
        if (trajet['fup8:contientTransportEnCommun'] && trajet['fup8:contientTransportEnCommun'][0]) {
            details.transportEnCommun = JSON.parse(trajet['fup8:contientTransportEnCommun'][0]['@value']);
        }
        if (trajet['fup8:contientVelo'] && trajet['fup8:contientVelo'][0]) {
            details.velo = JSON.parse(trajet['fup8:contientVelo'][0]['@value']);
        }
        if (trajet['fup8:contientMarche'] && trajet['fup8:contientMarche'][0]) {
            details.marche = JSON.parse(trajet['fup8:contientMarche'][0]['@value']);
        }
    } catch (e) {
        console.error("Erreur lors de l'extraction des détails:", e);
    }

    console.log("Détails extraits:", details);
    return details;
}

function displayTrajetCard(trajet) {
    const card = document.createElement('div');
    card.className = 'bg-white rounded-lg shadow-md mb-4 transition-all duration-300 hover:shadow-lg';
    
    // Construction de l'en-tête de la carte
    const headerContent = `
        <div class="p-4 border-b border-gray-200">
            <div class="flex justify-between items-start">
                <div>
                    <h5 class="text-xl font-semibold text-gray-800 mb-2">
                        ${trajet.nom || "Trajet sans nom"}
                    </h5>
                    <p class="text-sm text-gray-600">
                        De ${trajet.depart || "Non spécifié"} à ${trajet.arrivee || "Non spécifié"}
                    </p>
                </div>
                <button class="toggle-details px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors duration-200">
                    Lire plus
                </button>
            </div>
        </div>`;

    // Construction du corps de la carte (initialement caché)
    const bodyContent = `
        <div class="card-body hidden p-4 bg-gray-50">
            <div class="grid grid-cols-1 gap-4">
                ${trajet.voiture ? `
                    <div class="border-b border-gray-200 pb-2">
                        <span class="font-semibold text-gray-700">Voiture:</span>
                        <div class="pl-4">
                            <p class="text-gray-600">Distance: ${trajet.voiture.distance} km</p>
                            <p class="text-gray-600">Durée: ${trajet.voiture.duration} min</p>
                            <p class="text-gray-600">Émissions CO2: ${trajet.voiture.carbon} g</p>
                        </div>
                    </div>
                ` : ''}
                
                ${trajet.transportEnCommun ? `
                    <div class="border-b border-gray-200 pb-2">
                        <span class="font-semibold text-gray-700">Transport en commun:</span>
                        <div class="pl-4">
                            <p class="text-gray-600">Distance: ${trajet.transportEnCommun.distance} km</p>
                            <p class="text-gray-600">Durée: ${trajet.transportEnCommun.duration} min</p>
                            <p class="text-gray-600">Émissions CO2: ${trajet.transportEnCommun.carbon} g</p>
                        </div>
                    </div>
                ` : ''}
                
                ${trajet.velo ? `
                    <div class="border-b border-gray-200 pb-2">
                        <span class="font-semibold text-gray-700">Vélo:</span>
                        <div class="pl-4">
                            <p class="text-gray-600">Distance: ${trajet.velo.distance} km</p>
                            <p class="text-gray-600">Durée: ${trajet.velo.duration} min</p>
                            <p class="text-gray-600">Émissions CO2: ${trajet.velo.carbon} g</p>
                        </div>
                    </div>
                ` : ''}
                
                ${trajet.marche ? `
                    <div class="border-b border-gray-200 pb-2">
                        <span class="font-semibold text-gray-700">Marche:</span>
                        <div class="pl-4">
                            <p class="text-gray-600">Distance: ${trajet.marche.distance} km</p>
                            <p class="text-gray-600">Durée: ${trajet.marche.duration} min</p>
                            <p class="text-gray-600">Émissions CO2: ${trajet.marche.carbon} g</p>
                        </div>
                    </div>
                ` : ''}
                
                <button class="toggle-details w-full mt-4 px-4 py-2 bg-gray-600 text-white rounded-md hover:bg-gray-700 transition-colors duration-200">
                    Lire moins
                </button>
            </div>
        </div>`;

    card.innerHTML = headerContent + bodyContent;

    // Ajout des événements pour les boutons
    setTimeout(() => {
        const toggleButtons = card.querySelectorAll('.toggle-details');
        const cardBody = card.querySelector('.card-body');

        toggleButtons.forEach(button => {
            button.addEventListener('click', () => {
                cardBody.classList.toggle('hidden');
                toggleButtons.forEach(btn => {
                    btn.textContent = cardBody.classList.contains('hidden') ? 'Lire plus' : 'Lire moins';
                });
            });
        });
    }, 0);

    return card;
}

async function displayUserTrajets() {
    const userStr = localStorage.getItem('user');
    if (!userStr) {
        console.log('Aucun utilisateur connecté');
        return;
    }

    const user = JSON.parse(userStr);
    const userId = user.id;
    console.log("Recherche des trajets pour l'utilisateur:", userId);

    try {
        const trajets = await findUserTrajets(userId);
        console.log("Trajets trouvés:", trajets);

        const container = document.getElementById('data-cards');
        container.innerHTML = '';

        if (!trajets || trajets.length === 0) {
            container.innerHTML = `
                <div class="text-center p-8">
                    <div class="text-gray-500 text-xl">
                        Aucun trajet trouvé pour cet utilisateur.
                    </div>
                </div>
            `;
        } else {
            trajets.forEach(trajet => {
                const trajetDetails = extractTrajetDetails(trajet);
                console.log("Détails du trajet:", trajetDetails);
                const card = displayTrajetCard(trajetDetails);
                container.appendChild(card);
            });
        }
    } catch (error) {
        console.error("Erreur lors de l'affichage des trajets:", error);
        toast.show("Erreur lors du chargement des trajets", "error");
    }
}

// Appel de la fonction pour afficher les trajets de l'utilisateur
document.addEventListener('DOMContentLoaded', function() {
    displayUserTrajets();
});
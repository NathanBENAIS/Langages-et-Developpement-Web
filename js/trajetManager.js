// trajetManager.js
import { auth } from "../module/auth.js";
import { ToastManager } from "./toastManager.js";

const toast = new ToastManager();
const apiUrl = 'http://localhost/omeka-s/api/';
let a = new auth({
    mail: 'samuel.szoniecky@univ-paris8.fr',
    apiOmk: 'http://localhost/omeka-s/api/',
    ident: 'iF0FtB1maVYlCGq9QpfiwnBiVe80u2kO',
    key: 'YKuLrLZqQpBUQW9IGlQWHWkkdEQQd1W8',
});


const transportModes = ['car', 'transit', 'bicycle', 'pedestrian'];

function extractValue(text, prefix) {
    if (!text) return null;
    const matches = text.match(new RegExp(`${prefix}\\s*:\\s*([\\d.,]+|--)`));
    return matches ? matches[1] : '--';
}

document.addEventListener('DOMContentLoaded', function() {
    const routeContainer = document.getElementById('route-container');

    routeContainer.addEventListener('routeLoaded', function() {
        d3.select("#saveRouteButton").on("click", function(event) {
            event.preventDefault();
            console.log("Bouton save cliqué");
            const nom_trajet = d3.select("#nom_trajet").property("value");
            const depart = d3.select("#depart").property("value");
            const arrivee = d3.select("#arrivee").property("value");

            console.log("nom_trajet:", nom_trajet);
            console.log("depart:", depart);
            console.log("arrivee:", arrivee);

            // Validation des champs
            if (!nom_trajet.trim() || !depart.trim() || !arrivee.trim()) {
                toast.show("Veuillez remplir tous les champs du trajet", "error");
                return;
            }

            // Récupérer les informations de l'utilisateur connecté
            const userStr = localStorage.getItem('user');
            if (!userStr) {
                toast.show("Aucun utilisateur connecté", "error");
                return;
            }
            const user = JSON.parse(userStr);

            // Afficher un toast de chargement
            toast.show("Création du trajet en cours...", "warning");

            // Récupérer les données du trajet pour chaque mode de transport
            const carData = {
                distance: extractValue(document.getElementById('car_distance').textContent, 'Distance'),
                duration: extractValue(document.getElementById('car_duration').textContent, 'Durée'),
                carbon: extractValue(document.getElementById('car_carbon').textContent, 'Émissions CO2')
            };

            const transitData = {
                distance: extractValue(document.getElementById('transit_distance').textContent, 'Distance'),
                duration: extractValue(document.getElementById('transit_duration').textContent, 'Durée'),
                carbon: extractValue(document.getElementById('transit_carbon').textContent, 'Émissions CO2')
            };

            const bicycleData = {
                distance: extractValue(document.getElementById('bicycle_distance').textContent, 'Distance'),
                duration: extractValue(document.getElementById('bicycle_duration').textContent, 'Durée'),
                carbon: extractValue(document.getElementById('bicycle_carbon').textContent, 'Émissions CO2')
            };

            const pedestrianData = {
                distance: extractValue(document.getElementById('pedestrian_distance').textContent, 'Distance'),
                duration: extractValue(document.getElementById('pedestrian_duration').textContent, 'Durée'),
                carbon: extractValue(document.getElementById('pedestrian_carbon').textContent, 'Émissions CO2')
            };

            // Construire les données pour Omeka
            let data = {
                "o:resource_class": "fup8:Trajet",
                "o:resource_template": "Mobilité Durable - Trajet",
                "fup8:nomTrajet": nom_trajet,
                "fup8:pointDepart": depart,
                "fup8:pointArrivee": arrivee,
                "fup8:possedeTrajet": {
                    "o:id": user.id,
                    "@id": `http://localhost/omeka-s/api/items/${user.id}`
                },
                "fup8:contientVoiture": JSON.stringify(carData),
                "fup8:contientTransportEnCommun": JSON.stringify(transitData),
                "fup8:contientVelo": JSON.stringify(bicycleData),
                "fup8:contientMarche": JSON.stringify(pedestrianData)
            };

            console.log("Données préparées pour Omeka:", data);
            a.omk.createItem(data, function(response) {
                console.log(response);
                if (response != null) {
                    // Succès de la création
                    toast.show("Trajet créé avec succès !", "success");
                } else {
                    // Erreur lors de la création
                    toast.show("Erreur lors de la création du trajet. Veuillez réessayer.", "error");
                }
                d3.select("#resultCrea").text(JSON.stringify(response, null, 2));
            });
        });
    });
});
class TrajetManager {
    constructor() {
        this.transportModes = ['car', 'transit', 'bicycle', 'pedestrian'];
        this.initialized = false;
        this.init();
        
        console.log("Initialisation TrajetManager de l'objet auth:", a);
        console.log("Initialisation TrajetManager de l'objet omk:", a.omk);
    }




    init() {
        this.showLoading();
        
        const checkContainer = setInterval(() => {
            if (document.getElementById('route-container')) {
                clearInterval(checkContainer);
                this.setupEventListeners();
                this.initialized = true;
                console.log('TrajetManager initialized');
                this.hideLoading();
            }
        }, 100);
    }

    showLoading() {
        const loadingContainer = document.getElementById('loading-container');
        if (loadingContainer) {
            loadingContainer.style.display = 'flex';
        }
    }

    hideLoading() {
        const loadingContainer = document.getElementById('loading-container');
        if (loadingContainer) {
            loadingContainer.style.display = 'none';
        }
    }
    setupModeObservers() {
        this.transportModes.forEach(mode => {
            ['distance', 'duration', 'carbon'].forEach(type => {
                const elementId = `${mode}_${type}`;
                const element = document.getElementById(elementId);
                
                if (element) {
                    const observer = new MutationObserver(() => {
                        console.log(`Changement détecté pour ${elementId}`);
                        this.logTrajetInfo(mode);
                    });

                    observer.observe(element, {
                        childList: true,
                        characterData: true,
                        subtree: true,
                        attributes: true
                    });
                }
            });
        });
    }

    extractValue(text, prefix) {
        if (!text) return null;
        const matches = text.match(new RegExp(`${prefix}\\s*:\\s*([\\d.,]+|--)`));
        return matches ? matches[1] : '--';
    }

  


    
    setupEventListeners() {
        const originalCalculateAllRoutes = window.calculateAllRoutes;
        window.calculateAllRoutes = async () => {
            this.showLoading();
            console.log('Interception du calcul des itinéraires');
            
            try {
                await originalCalculateAllRoutes();
                
                setTimeout(() => {
                    console.log('Rafraîchissement des données après calcul');
                    this.refreshAllData();
                    this.hideLoading();
                }, 2000);
            } catch (error) {
                console.error('Erreur lors du calcul des itinéraires:', error);
                this.hideLoading();
            }
        };



        this.setupModeObservers();
    }


    logTrajetInfo(mode) {
        // Récupérer les éléments
        const distanceEl = document.getElementById(`${mode}_distance`);
        const durationEl = document.getElementById(`${mode}_duration`);
        const carbonEl = document.getElementById(`${mode}_carbon`);

        if (distanceEl && durationEl && carbonEl) {
            const distance = this.extractValue(distanceEl.textContent, 'Distance');
            const duration = this.extractValue(durationEl.textContent, 'Durée');
            const carbon = this.extractValue(carbonEl.textContent, 'Émissions CO2');

            const modeNames = {
                car: 'Voiture',
                transit: 'Transport en commun',
                bicycle: 'Vélo',
                pedestrian: 'À pied'
            };

            // Vérifier si au moins une des valeurs a changé
            if (distance !== '--' || duration !== '--' || carbon !== '--') {
                console.group(`=== Données du trajet - ${modeNames[mode]} ===`);
                console.log(`Distance : ${distance} km`);
                console.log(`Durée : ${duration} min`);
                console.log(`Émissions CO2 : ${carbon} g CO2e`);
                console.groupEnd();
                console.log('\n'); // Ajouter une ligne vide pour la lisibilité
            }
        }
    }

    refreshAllData() {
        console.log('Début du rafraîchissement des données pour tous les modes');
        this.transportModes.forEach(mode => {
            this.logTrajetInfo(mode);
        });
        console.log('Fin du rafraîchissement des données');

    }


}

// Créer et exporter l'instance
const trajetManager = new TrajetManager();
//  console.log('TrajetManager créé et prêt à l'utilisation');
export default trajetManager;
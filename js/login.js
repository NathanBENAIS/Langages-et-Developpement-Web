import { authInstance as a } from './config.js';
// import { pa as a } from '../module/authParams.js';
import { ToastManager } from "./toastManager.js";

// Initialisation
const toast = new ToastManager();


console.log("Initialisation de l'objet auth:", a);
console.log("Initialisation de l'objet auth:", a.omk);

// Fonction pour extraire les informations de l'utilisateur
function extractUserInfo(user) {
    return {
        id: user['o:id'],
        prenom: user['fup8:prenom'] ? user['fup8:prenom'][0]['@value'] : '',
        nom: user['fup8:nom'] ? user['fup8:nom'][0]['@value'] : '',
        email: user['fup8:email'] ? user['fup8:email'][0]['@value'] : ''
    };
}

// Fonction pour rechercher un utilisateur par email
function findUserByEmail(email) {
    return new Promise((resolve, reject) => {
        try {
            const query = `property[0][property]=231&property[0][type]=eq&property[0][text]=${encodeURIComponent(email)}`;
            a.omk.searchItems(query, (response) => {
                console.log("Réponse recherche utilisateur:", response);
                if (response && response.length > 0) {
                    const users = response.filter(item => 
                        item['@type'].includes('fup8:Utilisateur')
                    );
                    resolve(users);
                } else {
                    resolve([]);
                }
            });
        } catch (error) {
            console.error("Erreur lors de la recherche:", error);
            reject(error);
        }
    });
}

// Gestionnaire de connexion
document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', async function(event) {
            event.preventDefault();
            
            const email = document.getElementById('email').value;
            console.log("Tentative de connexion avec:", email);
            
            try {
               
                
                const users = await findUserByEmail(email);
                console.log("Utilisateurs trouvés:", users);
                
                if (users.length > 0) {
                    const user = users[0];
                    const userEmail = user['fup8:email'] && user['fup8:email'][0] ? 
                        user['fup8:email'][0]['@value'] : null;
                    
                    if (email === userEmail) {
                        // Extraire et sauvegarder les informations de l'utilisateur
                        const userInfo = extractUserInfo(user);
                        localStorage.setItem('user', JSON.stringify(userInfo));
                        
                        toast.show("Connexion réussie!", "success");
                        
                        setTimeout(() => {
                            window.location.href = 'index.html';
                        }, 1500);
                    } else {
                        toast.show("Email incorrect", "error");
                    }
                } else {
                    toast.show("Utilisateur non trouvé", "error");
                }
            } catch (error) {
                console.error("Erreur lors de la connexion:", error);
                toast.show("Erreur lors de la connexion", "error");
            }
        });
    }
});

// Gestionnaire d'inscription
d3.select("#btnRegister").on("click", function(event) {
    event.preventDefault();
    console.log("Bouton 'S'INSCRIRE' cliqué");

    const firstname = d3.select("#firstname").property("value");
    const lastname = d3.select("#lastname").property("value");
    const email = d3.select("#email").property("value");

    if (!firstname || !lastname || !email) {
        toast.show("Tous les champs sont obligatoires", "error");
        return;
    }

    // Création du compte
    const data = {
        "o:resource_class": "fup8:Utilisateur",
        "o:resource_template": "Mobilité Durable - Utilisateur",
        "fup8:prenom": firstname,
        "fup8:nom": lastname,
        "fup8:email": email,
    };

    // toast.show("Création du compte en cours...", "info");
    
    a.omk.createItem(data, function(response) {
        console.log("Réponse création:", response);
        if (response && response['o:id']) {
            // Sauvegarder les informations de l'utilisateur
            const userInfo = {
                id: response['o:id'],
                prenom: firstname,
                nom: lastname,
                email: email
            };
            localStorage.setItem('user', JSON.stringify(userInfo));
            
            toast.show("Compte créé avec succès!", "success");
            setTimeout(() => {
                window.location.href = 'index.html';
            }, 1500);
        } else {
            toast.show("Erreur lors de la création du compte", "error");
        }
    });
});

// Fonction de déconnexion
document.getElementById('logoutButton')?.addEventListener('click', () => {
    localStorage.removeItem('user');
    window.location.href = 'login.html';
});
import { auth } from '../module/auth.js';
import { omk } from '../module/omk.js';
import { loader } from '../module/loader.js';
import { ToastManager } from './ToastManager.js';

class SignUpManager {
    constructor() {
        this.loadingSpinner = new loader();
        this.adminAuth = null;
        this.omk = null;
        this.initialized = false;
        this.toastManager = new ToastManager();
    }

    async initialize() {
        try {
            console.log("Initialisation du SignUpManager...");
            
            // Créer l'instance OMK directement
            this.omk = new omk({
                api: 'http://localhost/omeka-s/api/',
                key: "9JDmKbxxRslkLzhJb4jC1LkWk3A7czr9",
                ident: "K0DTO51WJeHaNmmCuwMXwero9CLsxiAw",
                mail: "nathan.benais@gmail.com",
                vocabs: ["dcterms", "bc", "fup8"]
            });

            // Attendre que l'OMK soit initialisé
            await new Promise(resolve => setTimeout(resolve, 2000));

            // Initialisation de l'authentification
            this.adminAuth = new auth({
                mail: "nathan.benais@gmail.com",
                apiOmk: "http://localhost/omeka-s/api/",
                ident: "K0DTO51WJeHaNmmCuwMXwero9CLsxiAw",
                key: "9JDmKbxxRslkLzhJb4jC1LkWk3A7czr9",
                vocabs: ["dcterms", "bc", "fup8"],
                omk: this.omk
            });

            await new Promise(resolve => setTimeout(resolve, 1000));

            this.initialized = true;
            console.log("Initialisation terminée");
            this.setupFormListener();
        } catch (error) {
            console.error("Erreur d'initialisation:", error);
            this.toastManager.show("Erreur d'initialisation du système", 'error');
            throw error;
        }
    }

    async createUser(firstname, lastname, email) {
        if (!this.initialized || !this.omk) {
            throw new Error("Le système n'est pas initialisé");
        }

        try {
            const userData = {
                'o:resource_template': 'Mobilité Durable - Utilisateur',
                'o:resource_class': 'fup8:Utilisateur',
                'fup8:prenom': [{ p: 'Prénom', v: firstname }],
                'fup8:nom': [{ p: 'Nom', v: lastname }],
                'fup8:email': [{ p: 'Email', v: email }],
                'fup8:possedeTrajet': [{ p: 'Possède trajet', v: 'Non' }]
            };

            console.log('Données à envoyer:', userData);

            // Vérifier si l'email existe déjà
            const existingUser = await this.searchUserByEmail(email);
            if (existingUser) {
                throw new Error('Un compte existe déjà avec cet email');
            }

            return new Promise((resolve, reject) => {
                this.omk.createItem(userData, (result) => {
                    if (result && result['o:id']) {
                        // Stocker les informations utilisateur
                        localStorage.setItem('user', JSON.stringify({
                            id: result['o:id'],
                            prenom: firstname,
                            nom: lastname,
                            email: email
                        }));

                        this.toastManager.show('Compte créé avec succès!', 'success');
                        
                        setTimeout(() => {
                            window.location.href = 'login.html';
                        }, 1500);

                        resolve(result);
                    } else {
                        reject(new Error('Erreur lors de la création du compte'));
                    }
                });
            });
        } catch (error) {
            console.error('Erreur lors de la création:', error);
            this.toastManager.show(error.message || 'Erreur lors de la création du compte', 'error');
            throw error;
        }
    }

    async searchUserByEmail(email) {
        try {
            const query = `property[0][property]=fup8:email&property[0][type]=eq&property[0][text]=${encodeURIComponent(email)}`;
            const response = await this.omk.searchItems(query);
            return response && response.length > 0 ? response[0] : null;
        } catch (error) {
            console.error('Erreur de recherche:', error);
            return null;
        }
    }

    setupFormListener() {
        const form = document.getElementById('signupForm');
        if (!form) {
            console.error("Formulaire d'inscription non trouvé");
            return;
        }

        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            this.loadingSpinner.show();

            try {
                const firstname = document.getElementById('firstname').value;
                const lastname = document.getElementById('lastname').value;
                const email = document.getElementById('email').value;

                await this.createUser(firstname, lastname, email);

            } catch (error) {
                console.error('Erreur:', error);
                this.toastManager.show(error.message || 'Erreur lors de la création du compte', 'error');
            } finally {
                this.loadingSpinner.hide(true);
            }
        });
    }
}

// Initialisation
document.addEventListener('DOMContentLoaded', async () => {
    try {
        const signUpManager = new SignUpManager();
        await signUpManager.initialize();
    } catch (error) {
        console.error("Erreur fatale:", error);
    }
});

export { SignUpManager };
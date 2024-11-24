import { auth } from '../module/auth.js';
import { omk } from '../module/omk.js';
import { loader } from '../module/loader.js';
import { ToastManager } from './ToastManager.js';

class LoginManager {
    constructor() {
        this.loadingSpinner = new loader();
        this.adminAuth = null;
        this.omk = null;
        this.initialized = false;
        this.apiBase = 'http://localhost/omeka-s/api';
        this.toastManager = new ToastManager();
    }

    async initializeAuth() {
        try {
            console.log("Initialisation de l'authentification...");
            
            // Créer l'instance OMK directement
            this.omk = new omk({
                api: `${this.apiBase}/`,
                key: "9JDmKbxxRslkLzhJb4jC1LkWk3A7czr9",
                ident: "K0DTO51WJeHaNmmCuwMXwero9CLsxiAw",
                mail: "nathan.benais@gmail.com",
                vocabs: ["dcterms", "bc"]
            });

            console.log("Instance OMK créée:", this.omk);

            // Attendre l'initialisation d'OMK
            await new Promise(resolve => setTimeout(resolve, 2000));

            // Créer l'instance auth avec l'OMK déjà initialisé
            this.adminAuth = new auth({
                mail: "nathan.benais@gmail.com",
                apiOmk: `${this.apiBase}/`,
                ident: "K0DTO51WJeHaNmmCuwMXwero9CLsxiAw",
                key: "9JDmKbxxRslkLzhJb4jC1LkWk3A7czr9",
                vocabs: ["dcterms", "bc"],
                omk: this.omk
            });

            console.log("Instance auth créée avec OMK:", this.adminAuth);

            // Charger les propriétés
            if (this.omk && typeof this.omk.getProps === 'function') {
                await Promise.all([
                    this.omk.getProps("dcterms"),
                    this.omk.getProps("bc")
                ]);
                console.log("Propriétés chargées");
            }

            return true;
        } catch (error) {
            console.error("Erreur d'initialisation:", error);
            throw error;
        }
    }

    async searchUser(email) {
        if (!this.omk) {
            throw new Error("OMK n'est pas initialisé");
        }

        try {
            // Fetch all items first
            const items = await this.omk.getAllItems('');
            
            // Search for matching email
            const user = items.find(item => {
                if (!item['fup8:email'] || !item['fup8:email'][0]) return false;
                try {
                    const emailValue = item['fup8:email'][0]['@value'];
                    const parsedEmail = JSON.parse(emailValue);
                    return parsedEmail.v === email;
                } catch (e) {
                    console.warn('Error parsing email:', e);
                    return false;
                }
            });

            console.log("Found user:", user);
            return user;
        } catch (error) {
            console.error("Erreur de recherche utilisateur:", error);
            throw error;
        }
    }

    extractValue(item, property) {
        try {
            const propValue = item[property] && item[property][0] ? item[property][0]['@value'] : '';
            if (!propValue) return '';
            
            try {
                const parsed = JSON.parse(propValue);
                return parsed.v || '';
            } catch (e) {
                // Si le parsing JSON échoue, retourner la valeur telle quelle
                return propValue;
            }
        } catch (error) {
            console.error(`Erreur d'extraction de la valeur ${property}:`, error);
            return '';
        }
    }

    async handleLogin(email) {
        try {
            console.log("Tentative de connexion pour:", email);
            this.loadingSpinner.show();

            if (!this.initialized) {
                await this.initializeAuth();
                this.initialized = true;
            }

            const user = await this.searchUser(email);
            
            if (!user) {
                throw new Error('Aucun utilisateur trouvé avec cet email');
            }

            const userData = {
                id: user['o:id'],
                email: this.extractValue(user, 'fup8:email'),
                prenom: this.extractValue(user, 'fup8:prenom'),
                nom: this.extractValue(user, 'fup8:nom')
            };

            console.log("Données utilisateur extraites:", userData);

            if (!this.validateUserData(userData)) {
                throw new Error('Données utilisateur incomplètes');
            }

            localStorage.setItem('user', JSON.stringify(userData));
            this.toastManager.show('Connexion réussie!', 'success');
            
            setTimeout(() => {
                window.location.href = 'index.html';
            }, 1500);

        } catch (error) {
            console.error("Erreur de connexion:", error);
            this.toastManager.show(error.message, 'error');
        } finally {
            this.loadingSpinner.hide(true);
        }
    }

    validateUserData(userData) {
        const isValid = !!(userData.id && userData.email && userData.prenom && userData.nom);
        console.log("Validation des données utilisateur:", userData);
        return isValid;
    }

    setupLoginForm() {
        const loginForm = document.getElementById('loginForm');
        if (!loginForm) {
            console.error("Formulaire de connexion non trouvé");
            return;
        }

        loginForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const emailInput = document.getElementById('email');
            if (!emailInput) return;
            await this.handleLogin(emailInput.value);
        });
    }

    async initialize() {
        try {
            console.log("Démarrage de l'initialisation...");
            await this.initializeAuth();
            this.setupLoginForm();
            this.initialized = true;
            console.log("Initialisation terminée avec succès");
        } catch (error) {
            console.error("Erreur d'initialisation:", error);
            this.toastManager.show("Erreur d'initialisation du système", 'error');
        }
    }
}

// Initialisation
document.addEventListener('DOMContentLoaded', async () => {
    try {
        const loginManager = new LoginManager();
        await loginManager.initialize();
    } catch (error) {
        console.error("Erreur fatale:", error);
    }
});

export { LoginManager };
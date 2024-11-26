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

    async saveTrajet() {
        try {
            const userStr = localStorage.getItem('user');
            if (!userStr) {
                toast.show("Veuillez vous connecter pour sauvegarder un trajet", "error");
                return;
            }

            const user = JSON.parse(userStr);
            const nomTrajet = d3.select('#nom_trajet').property('value');
            const depart = d3.select('#depart').property('value');
            const arrivee = d3.select('#arrivee').property('value');

            if (!nomTrajet || !depart || !arrivee) {
                toast.show("Veuillez remplir tous les champs du trajet", "error");
                return;
            }

            // Récupérer les données de tous les modes de transport
            const modesData = {};
            this.transportModes.forEach(mode => {
                const distanceEl = d3.select(`#${mode}_distance`);
                const durationEl = d3.select(`#${mode}_duration`);
                const carbonEl = d3.select(`#${mode}_carbon`);

                if (!distanceEl.empty() && !durationEl.empty() && !carbonEl.empty()) {
                    modesData[mode] = {
                        distance: this.extractValue(distanceEl.text(), 'Distance'),
                        duration: this.extractValue(durationEl.text(), 'Durée'),
                        carbon: this.extractValue(carbonEl.text(), 'Émissions CO2')
                    };
                }
            });

            // Récupérer le type de carburant
            const fuelType = d3.select('#fuel_type').property('value');

            let data = {
                "o:resource_class": "bc:Trajet",
                "o:resource_template": "Mobilité Durable - Trajet",
                "bc:nomTrajet": nomTrajet,
                "bc:pointDepart": depart,
                "bc:pointArrivee": arrivee,
                "bc:utiliseModeTransport": [
                    {
                        "o:resource_class": "bc:Voiture",
                        "bc:distance": modesData.car.distance,
                        "bc:duree": modesData.car.duration,
                        "bc:emissionsCO2": modesData.car.carbon,
                        "bc:typeCarburant": fuelType
                    },
                    {
                        "o:resource_class": "bc:TransportEnCommun",
                        "bc:distance": modesData.transit.distance,
                        "bc:duree": modesData.transit.duration,
                        "bc:emissionsCO2": modesData.transit.carbon
                    },
                    {
                        "o:resource_class": "bc:Velo",
                        "bc:distance": modesData.bicycle.distance,
                        "bc:duree": modesData.bicycle.duration,
                        "bc:emissionsCO2": modesData.bicycle.carbon
                    },
                    {
                        "o:resource_class": "bc:Marche",
                        "bc:distance": modesData.pedestrian.distance,
                        "bc:duree": modesData.pedestrian.duration,
                        "bc:emissionsCO2": modesData.pedestrian.carbon
                    }
                ],
                "bc:possedeTrajet": {
                    "o:id": user.id
                }
            };

            toast.show("Sauvegarde du trajet en cours...", "warning");

            a.omk.createItem(data, function(response) {
                console.log(response);
                if (response != null) {
                    toast.show("Trajet sauvegardé avec succès !", "success");
                } else {
                    toast.show("Erreur lors de la sauvegarde du trajet. Veuillez réessayer.", "error");
                }
            });

        } catch (error) {
            console.error("Erreur lors de la sauvegarde du trajet:", error);
            toast.show("Erreur lors de la sauvegarde du trajet", "error");
        }
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

        // Ajout de l'écouteur sur le bouton de sauvegarde avec d3
        d3.select('#saveRouteButton').on('click', () => this.saveTrajet());

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

    logTrajetInfo(mode) {
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

            if (distance !== '--' || duration !== '--' || carbon !== '--') {
                console.log(`=== Données du trajet - ${modeNames[mode]} ===`);
                console.log(`Distance : ${distance} km`);
                console.log(`Durée : ${duration} min`);
                console.log(`Émissions CO2 : ${carbon} g CO2e`);
                console.log('\n');
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
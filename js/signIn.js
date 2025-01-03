import { authInstance as a } from './config.js';
import { ToastManager } from "./toastManager.js";

// Initialisation du gestionnaire de toast
const toast = new ToastManager();



console.log("Initialisation de l'objet auth:", a);

// Fonction de validation des champs
function validateFields(firstname, lastname, email) {
    if (!firstname.trim()) {
        window.toastManager.show("Le prénom est requis", "error");
        return false;
    }
    if (!lastname.trim()) {
        window.toastManager.show("Le nom est requis", "error");
        return false;
    }
    if (!email.trim()) {
        window.toastManager.show("L'email est requis", "error");
        return false;
    }
    // Validation basique de l'email
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        window.toastManager.show("Veuillez entrer une adresse email valide", "error");
        return false;
    }
    return true;
}

d3.select("#btnRegister").on("click", function(event) {
    event.preventDefault();
    console.log("Bouton 'S'INSCRIRE' cliqué");

    // Collecter les données du formulaire
    const firstname = d3.select("#firstname").property("value");
    const lastname = d3.select("#lastname").property("value");
    const email = d3.select("#email").property("value");

    console.log("Prénom:", firstname);
    console.log("Nom:", lastname);
    console.log("Email:", email);

    // Valider les champs
    if (!validateFields(firstname, lastname, email)) {
        return;
    }

    // Afficher un toast de chargement
    toast.show("Création du compte en cours...", "warning");

    // Construire les données pour Omeka
    let data = {
        "o:resource_class": "fup8:Utilisateur",
        "o:resource_template": "Mobilité Durable - Utilisateur",
        "fup8:prenom": firstname,
        "fup8:nom": lastname,
        "fup8:email": email,
    };

    console.log("Données préparées pour Omeka:", data);
    a.omk.createItem(data, function(response) {
        console.log(response);
        if (response != null) {
            // Succès de la création
            toast.show("Compte créé avec succès !", "success");
    
           
        } else {
            // Erreur lors de la création
            toast.show("Erreur lors de la création du compte. Veuillez réessayer.", "error");
        }
        d3.select("#resultCrea").text(JSON.stringify(response, null, 2));
    });
});

// Tracer le chargement complet du DOM
document.addEventListener('DOMContentLoaded', function () {
    console.log('DOM chargé et prêt à être manipulé');
    const signupForm = document.getElementById('signupForm');
    
    // Gestion de la soumission du formulaire
    signupForm.addEventListener('submit', function (event) {
        event.preventDefault();
        console.log("Soumission du formulaire interceptée");
    });

    // Suivre les changements dans les champs d'entrée
    const inputs = signupForm.querySelectorAll('input');
    inputs.forEach(input => {
        input.addEventListener('change', function (e) {
            console.log(`Modification dans le champ ${e.target.id}:`, e.target.value);
        });
    });
});

console.log("Fin de l'initialisation du script.");
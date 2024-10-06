const csvUrl = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQ6Gvel3BRcW1gwcvjGrEoFi1rQFmAXmMVjBotpMiBAt2uULjAd8zw0cTvZn6GIdga-DFgdgWKvpOpU/pub?gid=48369834&single=true&output=csv';

$("#loading-message").show();
$("#data-cards").hide();
$("#error-message").hide();

let allData = []; // Pour stocker toutes les données

d3.csv(csvUrl).then(data => {
    $("#loading-message").hide();
    $("#data-cards").show();
    
    allData = data; // Stocker toutes les données

    // Remplir les filtres
    fillFilters(data);
    
    // Afficher les cartes initiales
    displayCards(data);
    
    // Ajouter les gestionnaires d'événements pour les filtres
    $("#roleFilter, #objectiveFilter, #cityFilter").on("change", function() {
        filterCards();
    });

    // Ajouter des marqueurs sur la carte
    addMarkers(data);
}).catch(error => {
    console.error("Erreur lors du chargement des données :", error);
    $("#loading-message").hide();
    $("#error-message").show();
});

function fillFilters(data) {
    const roles = new Set();
    const objectives = new Set();
    const cities = new Set(); // Set pour stocker les villes

    data.forEach(row => {
        roles.add(row["Quel est votre rôle dans le projet de mobilité durable ?"]);
        objectives.add(row["Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?"]);
        
        // Extraire la ville de l'adresse (en supposant que l'adresse est formatée comme "Numéro Rue, Ville, Code Postal")
        const addressParts = row["Adresse\n"].trim().split(",");
        if (addressParts.length > 1) {
            const city = addressParts[1].trim(); // Prendre la partie de la ville
            cities.add(city);
        }
    });

    roles.forEach(role => {
        $("#roleFilter").append(`<option value="${role}">${role}</option>`);
    });

    objectives.forEach(objective => {
        $("#objectiveFilter").append(`<option value="${objective}">${objective}</option>`);
    });

    // Remplir le filtre de ville
    cities.forEach(city => {
        $("#cityFilter").append(`<option value="${city}">${city}</option>`);
    });
}

function filterCards() {
    const selectedRole = $("#roleFilter").val();
    const selectedObjective = $("#objectiveFilter").val();
    const selectedCity = $("#cityFilter").val(); // Récupérer la ville sélectionnée

    $("#data-cards .card").each(function() {
        const cardRole = $(this).data("role");
        const cardObjective = $(this).data("objective");
        const address = $(this).find(".card-body").text(); // Récupérer le texte de l'adresse

        // Extraire la ville de l'adresse
        const addressParts = address.split(",");
        const cardCity = addressParts.length > 1 ? addressParts[1].trim() : ""; // Prendre la partie de la ville

        const matchesRole = selectedRole === "" || cardRole === selectedRole;
        const matchesObjective = selectedObjective === "" || cardObjective === selectedObjective;
        const matchesCity = selectedCity === "" || cardCity === selectedCity; // Vérifier la ville

        if (matchesRole && matchesObjective && matchesCity) {
            $(this).show();
        } else {
            $(this).hide();
        }
    });
}

function displayCards(data) {
    $("#data-cards").empty(); // Vider les cartes existantes

    data.forEach(function(row) {
        var contactAnswer = row["Souhaitez-vous être contacté pour participer à des projets collaboratifs en mobilité durable ?\n(Oui/Non)  "].trim();
        var coordonnees = row["Si oui, veuillez indiquer vos coordonnées :"].trim();
        
        var card = 
            `<div class="card mb-3" data-role="${row["Quel est votre rôle dans le projet de mobilité durable ?"]}" data-objective="${row["Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?"]}">
                <div class="card-header">
                    <h5 class="card-title"><strong>Nom de l'organisation / entité : </strong>${row["Nom de l'organisation / entité "]}</h5>
                    <p class="card-text"><strong>Rôle dans le projet de mobilité durable : </strong>${row["Quel est votre rôle dans le projet de mobilité durable ?"]}</p>
                    <button class="btn btn-primary toggle-details">Lire plus</button>
                </div>
                <div class="card-body" style="display: none;">
                    <p><strong>Horodateur:</strong> ${row["Horodateur"]}</p>
                    <p><strong>Objectifs:</strong> ${row["Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?"]}</p>
                    <p><strong>Besoins:</strong> ${row["Quels sont vos besoins spécifiques pour atteindre ces objectifs ?"]}</p>
                    <p><strong>Collaboration:</strong> ${row["Travaillez-vous actuellement avec d'autres acteurs du secteur pour répondre à ces besoins ?\n(Oui/Non)\nSi oui, veuillez préciser avec qui et comment."]}</p>
                    <p><strong>Obstacles:</strong> ${row["Quels sont les principaux obstacles auxquels vous faites face dans le développement de solutions de mobilité durable ?"]}</p>
                    <p><strong>Priorités:</strong> ${row["Quelles sont vos priorités pour surmonter ces obstacles ?"]}</p>
                    <p><strong>Solutions Innovantes:</strong> ${row["Avez-vous mis en œuvre des solutions innovantes dans le domaine de la mobilité durable ?\n(Oui/Non)\nSi oui, veuillez détailler les solutions mises en place."]}</p>
                    <p><strong>Innovations Futures:</strong> ${row["Quels types d'innovation technologique ou de collaboration souhaiteriez-vous développer à l'avenir ?"]}</p>
                    <p><strong>Contact:</strong> ${contactAnswer}</p>
                    ${contactAnswer.toLowerCase() === "oui" && coordonnees 
                    ? `<p><strong>Coordonnées:</strong> ${coordonnees}</p>` 
                    : ""}
                    <p><strong>Nom et Prénom :</strong> ${row["prenom"]} ${row["Nom"]}</p>
                    <p><strong>Téléphone :</strong> ${row["Téléphone"]}</p>
                    <p><strong>Adresse :</strong> ${row["Adresse\n"]}</p>
                    <button class="btn btn-secondary toggle-details">Lire moins</button>
                </div>
            </div>`;
        $("#data-cards").append(card);
    });

    $(".toggle-details").click(function() {
        var cardBody = $(this).closest(".card").find(".card-body");
        cardBody.slideToggle();
        $(this).text($(this).text() === "Lire plus" ? "Lire moins" : "Lire plus");
    });
}

function filterCards() {
    const selectedRole = $("#roleFilter").val();
    const selectedObjective = $("#objectiveFilter").val();

    $("#data-cards .card").each(function() {
        const cardRole = $(this).data("role");
        const cardObjective = $(this).data("objective");

        const matchesRole = selectedRole === "" || cardRole === selectedRole;
        const matchesObjective = selectedObjective === "" || cardObjective === selectedObjective;

        if (matchesRole && matchesObjective) {
            $(this).show();
        } else {
            $(this).hide();
        }
    });
}

// Fonction pour ajouter des marqueurs à partir des données
function addMarkers(data) {
    // Initialiser la carte
    const map = L.map('map').setView([48.8566, 2.3522], 6); // Initialiser la carte sur Paris

    // Ajouter une couche de fond (carte OpenStreetMap)
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '© OpenStreetMap'
    }).addTo(map);

    data.forEach(row => {
        const address = row["Adresse\n"]; // Récupérer l'adresse

        // Utiliser un service de géocodage pour convertir l'adresse en coordonnées
        fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(address)}`)
            .then(response => response.json())
            .then(location => {
                if (location.length > 0) {
                    const lat = location[0].lat;
                    const lon = location[0].lon;

                    // Ajouter un marqueur à la carte
                    L.marker([lat, lon]).addTo(map)
                        .bindPopup(`<strong>${row["Nom de l'organisation / entité "]}</strong><br>${address}`);
                }
            })
            .catch(err => console.error('Erreur de géocodage:', err));
    });
}
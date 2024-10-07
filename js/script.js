const csvUrl = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQ6Gvel3BRcW1gwcvjGrEoFi1rQFmAXmMVjBotpMiBAt2uULjAd8zw0cTvZn6GIdga-DFgdgWKvpOpU/pub?gid=48369834&single=true&output=csv';

let allData = []; // Pour stocker toutes les données
let roleChart, objectiveChart, historyChart;
let map; // Déclaration globale de la carte

$(document).ready(function() {
    $("#loading-message").show();
    $("#data-cards").hide();
    $("#error-message").hide();

    initCharts();

    d3.csv(csvUrl).then(data => {
        $("#loading-message").hide();
        $("#data-cards").show();
        
        allData = data; // Stocker toutes les données

        // Remplir les filtres
        fillFilters(data);
        
        // Afficher les cartes initiales
        displayCards(data);
        
        // Initialiser la carte
        initMap();
        
        // Ajouter les gestionnaires d'événements pour les filtres
        $("#roleFilter, #objectiveFilter, #cityFilter").on("change", function() {
            applyFilters();
        });

        // Mettre à jour les graphiques
        updateCharts(data);
        updateHistoryChart(data);
    }).catch(error => {
        console.error("Erreur lors du chargement des données :", error);
        $("#loading-message").hide();
        $("#error-message").show();
    });
});

function fillFilters(data) {
    const roles = new Set();
    const objectives = new Set();
    const cities = new Set();

    data.forEach(row => {
        roles.add(row["Quel est votre rôle dans le projet de mobilité durable ?"]);
        objectives.add(row["Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?"]);
        
        const addressParts = row["Adresse\n"].trim().split(",");
        if (addressParts.length > 1) {
            const city = addressParts[1].trim();
            cities.add(city);
        }
    });

    fillSelect("#roleFilter", roles);
    fillSelect("#objectiveFilter", objectives);
    fillSelect("#cityFilter", cities);
}

function fillSelect(selectId, options) {
    const select = $(selectId);
    options.forEach(option => {
        select.append(`<option value="${option}">${option}</option>`);
    });
}

function displayCards(data) {
    $("#data-cards").empty();

    data.forEach(function(row) {
        var contactAnswer = row["Souhaitez-vous être contacté pour participer à des projets collaboratifs en mobilité durable ?\n(Oui/Non)  "].trim();
        var coordonnees = row["Si oui, veuillez indiquer vos coordonnées :"].trim();
        
        var card = `
            <div class="card mb-3" data-role="${row["Quel est votre rôle dans le projet de mobilité durable ?"]}" data-objective="${row["Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?"]}" data-city="${row["Adresse\n"].split(',')[1]?.trim() || ''}">
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

function applyFilters() {
    const selectedRole = $("#roleFilter").val();
    const selectedObjective = $("#objectiveFilter").val();
    const selectedCity = $("#cityFilter").val();

    const filteredData = allData.filter(row => {
        const matchesRole = selectedRole === "" || row["Quel est votre rôle dans le projet de mobilité durable ?"] === selectedRole;
        const matchesObjective = selectedObjective === "" || row["Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?"] === selectedObjective;
        const matchesCity = selectedCity === "" || row["Adresse\n"].split(',')[1]?.trim() === selectedCity;

        return matchesRole && matchesObjective && matchesCity;
    });

    // Mettre à jour les cartes
    displayCards(filteredData);

    // Mettre à jour la carte
    updateMap(filteredData);

    // Mettre à jour les graphiques
    updateCharts(filteredData);
    updateHistoryChart(filteredData);
}

function initMap() {
    map = L.map('map').setView([48.8566, 2.3522], 6);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '© OpenStreetMap'
    }).addTo(map);

    updateMap(allData);
}

function updateMap(data) {
    // Supprimer tous les marqueurs existants
    map.eachLayer((layer) => {
        if (layer instanceof L.Marker) {
            map.removeLayer(layer);
        }
    });

    // Ajouter de nouveaux marqueurs
    data.forEach(row => {
        const address = row["Adresse\n"];

        fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(address)}`)
            .then(response => response.json())
            .then(location => {
                if (location.length > 0) {
                    const lat = location[0].lat;
                    const lon = location[0].lon;

                    L.marker([lat, lon]).addTo(map)
                        .bindPopup(`<strong>${row["Nom de l'organisation / entité "]}</strong><br>${address}`);
                }
            })
            .catch(err => console.error('Erreur de géocodage:', err));
    });
}

function initCharts() {
    const commonOptions = {
        responsive: true,
        plugins: {
            legend: {
                position: 'bottom'
            }
        }
    };

    roleChart = new Chart(document.getElementById('roleChart').getContext('2d'), {
        type: 'pie',
        data: {
            labels: [],
            datasets: [{
                data: [],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.8)',
                    'rgba(54, 162, 235, 0.8)',
                    'rgba(255, 206, 86, 0.8)',
                    'rgba(75, 192, 192, 0.8)',
                    'rgba(153, 102, 255, 0.8)',
                ]
            }]
        },
        options: {
            ...commonOptions,
            plugins: {
                ...commonOptions.plugins,
                title: {
                    display: true,
                    text: 'Distribution des rôles'
                }
            }
        }
    });

    objectiveChart = new Chart(document.getElementById('objectiveChart').getContext('2d'), {
        type: 'pie',
        data: {
            labels: [],
            datasets: [{
                data: [],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.8)',
                    'rgba(54, 162, 235, 0.8)',
                    'rgba(255, 206, 86, 0.8)',
                    'rgba(75, 192, 192, 0.8)',
                    'rgba(153, 102, 255, 0.8)',
                ]
            }]
        },
        options: {
            ...commonOptions,
            plugins: {
                ...commonOptions.plugins,
                title: {
                    display: true,
                    text: 'Distribution des objectifs'
                }
            }
        }
    });

    historyChart = new Chart(document.getElementById('historyChart').getContext('2d'), {
        type: 'line',
        data: {
            datasets: [{
                label: 'Nombre cumulatif d\'événements',
                data: [],
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                tension: 0.1,
                pointRadius: 5,
                pointHoverRadius: 8
            }]
        },
        options: {
            ...commonOptions,
            plugins: {
                ...commonOptions.plugins,
                title: {
                    display: true,
                    text: 'Évolution mensuelle du nombre d\'événements'
                }
            },
            scales: {
                x: {
                    type: 'time',
                    time: {
                        unit: 'month',
                        displayFormats: {
                            month: 'MMM yyyy'
                        }
                    },
                    title: {
                        display: true,
                        text: 'Mois'
                    }
                },
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Nombre cumulatif d\'événements'
                    }
                }
            }
        }
    });
}

function updateCharts(data) {
    if (data && data.length > 0) {
        updatePieChart(roleChart, 'Quel est votre rôle dans le projet de mobilité durable ?', data);
        updatePieChart(objectiveChart, 'Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?', data);
    } else {
        console.warn("Aucune donnée disponible pour mettre à jour les graphiques");
    }
}

function updatePieChart(chart, key, data) {
    if (!data || data.length === 0) {
        console.warn("Aucune donnée disponible pour mettre à jour le graphique en camembert");
        return;
    }

    const chartData = {};
    data.forEach(row => {
        const value = row[key];
        if (value) {
            if (value in chartData) {
                chartData[value]++;
            } else {
                chartData[value] = 1;
            }
        }
    });

    chart.data.labels = Object.keys(chartData);
    chart.data.datasets[0].data = Object.values(chartData);
    chart.update();
}

function updateHistoryChart(data) {
    if (!data || data.length === 0) {
        console.warn("Aucune donnée disponible pour mettre à jour le graphique historique");
        return;
    }

    // Fonction pour parser l'horodateur en objet Date
    function parseDateTime(dateTimeString) {
        if (!dateTimeString) return null;
        const [datePart, timePart] = dateTimeString.split(' ');
        const [day, month, year] = datePart.split('/');
        const [hours, minutes, seconds] = timePart.split(':');
        return new Date(year, month - 1, day, hours, minutes, seconds);
    }

    // Trier les données par horodateur
    data.sort((a, b) => {
        const dateA = parseDateTime(a.Horodateur);
        const dateB = parseDateTime(b.Horodateur);
        return dateA && dateB ? dateA - dateB : 0;
    });

    // Préparer les données pour le graphique
    const chartData = data.reduce((acc, row, index) => {
        const date = parseDateTime(row.Horodateur);
        if (date) {
            acc.push({
                x: date,
                y: index + 1 // Nombre cumulatif d'événements
            });
        }
        return acc;
    }, []);

    // Mettre à jour le graphique
    historyChart.data.datasets[0].data = chartData;

    // Configurer les options de l'axe X pour afficher date et heure
    historyChart.options.scales.x = {
        type: 'time',
        time: {
            unit: 'day',
            displayFormats: {
                day: 'dd/MM/yyyy HH:mm'
            }
        },
        title: {
            display: true,
            text: 'Date et Heure'
        }
    };

    // Mettre à jour le graphique
    historyChart.update();
}

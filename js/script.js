const csvUrl = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQ6Gvel3BRcW1gwcvjGrEoFi1rQFmAXmMVjBotpMiBAt2uULjAd8zw0cTvZn6GIdga-DFgdgWKvpOpU/pub?gid=48369834&single=true&output=csv';
let allData = [];

$(document).ready(function() {
    $("#loading-message").show();
    $("#data-cards").hide();
    $("#error-message").hide();

    initCharts();

    d3.csv(csvUrl).then(data => {
        $("#loading-message").hide();
        $("#data-cards").show();
        
        allData = data; // Stocker toutes les données

        fillFilters(data);
        displayCards(data);
        // initMap(); // Initialiser la carte après le chargement des données
        
        if (typeof initMap === 'function') {
            initMap();
        } else {
            console.error("La fonction initMap n'est pas définie");
        }

        $("#roleFilter, #objectiveFilter, #cityFilter").on("change", applyFilters);

        updateCharts(data);
        updateHistoryChart(data);
    }).catch(error => {
        console.error("Erreur lors du chargement des données :", error);
        $("#loading-message").hide();
        $("#error-message").show();
    });
});

// Exporter allData pour qu'il soit accessible dans d'autres fichiers
window.allData = allData;
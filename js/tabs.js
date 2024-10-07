// Initialiser l'onglet actif par défaut
$(".nav-link").removeClass("active");
$(".nav-link").first().addClass("active");

// Afficher uniquement la section des cartes lors du chargement
$("#data-cards").show();

// Gestion des clics sur les onglets
$(".nav-link").on("click", function() {
    const tabId = $(this).text().trim();
    
    // Masquer tous les contenus
    $("#data-cards, #map, #charts-container, #history-container").hide();

    // Afficher le bon contenu en fonction de l'onglet sélectionné
    switch(tabId) {
        case "Événement":
            $("#data-cards").show();
            break;
        case "Carte interactive":
            $("#map").show();
            break;
        case "Graphiques":
            $("#charts-container").show();
            updateCharts(); // Fonction définie dans script.js
            break;
        case "Historique":
            $("#history-container").show();
            updateHistoryChart(); // Fonction définie dans script.js
            break;
        default:
            alert(tabId);
    }

    // Mettre à jour la classe active sur les onglets
    $(".nav-link").removeClass("active");
    $(this).addClass("active");
});
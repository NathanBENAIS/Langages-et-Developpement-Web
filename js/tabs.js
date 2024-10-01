// Initialiser l'onglet actif par défaut
$(".nav-link").removeClass("active"); // Supprimer la classe active de tous les onglets
$(".nav-link").first().addClass("active"); // Ajouter active à l'onglet Événement (le premier)

// Afficher uniquement la section des cartes lors du chargement
$("#data-cards").show(); // Afficher la section des cartes
// Pas besoin de cacher la carte ici, car elle est déjà masquée par CSS

// Gestion des clics sur les onglets
$(".nav-link").on("click", function() {
    const tabId = $(this).text().trim();
    
    // Masquer tous les contenus
    $("#data-cards, #map").hide(); // Supprimez loading-message et error-message si non nécessaire

    // Afficher le bon contenu en fonction de l'onglet sélectionné
    if (tabId === "Événement") {
        $("#data-cards").show(); // Afficher les données
    } else if (tabId === "Carte interactive") {
        $("#map").show(); // Afficher la carte
    } else {
        alert(tabId); // Ou vous pouvez afficher un autre contenu si nécessaire
    }

    // Mettre à jour la classe active sur les onglets
    $(".nav-link").removeClass("active"); // Supprimer la classe active de tous les onglets
    $(this).addClass("active"); // Ajouter active à l'onglet cliqué
});

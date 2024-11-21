// JavaScript pour gérer les changements de tabs
document.addEventListener("DOMContentLoaded", () => {
    const tabButtons = document.querySelectorAll("[data-tabs-target]");
    const tabContents = document.querySelectorAll("[role='tabpanel']");

    tabButtons.forEach(button => {
        button.addEventListener("click", () => {
            // Cache tous les contenus d'onglets
            tabContents.forEach(content => {
                content.classList.add("hidden");
            });

            // Supprime la classe active de tous les boutons d'onglets
            tabButtons.forEach(btn => {
                btn.classList.remove("border-blue-500", "text-blue-500");
            });

            // Affiche le contenu correspondant à l'onglet cliqué
            const tabId = button.getAttribute("data-tabs-target");
            document.querySelector(tabId).classList.remove("hidden");

            // Ajoute une classe pour styliser l'onglet actif
            button.classList.add("border-blue-500", "text-blue-500");
        });
    });

    // Active le premier onglet par défaut
    tabButtons[0].click();
});

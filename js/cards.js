let allData = [];

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('fr-FR', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
}

function displayCards(data) {
    const container = document.getElementById('data-cards');
    container.innerHTML = '';

    data.forEach(item => {
        const contactAnswer = item["Souhaitez-vous être contacté"] || "Non renseigné";
        const coordonnees = item["Coordonnées"] || "";
        
        const card = document.createElement('div');
        card.className = 'bg-white rounded-lg shadow-md mb-4 transition-all duration-300 hover:shadow-lg';
        
        // Construction de l'en-tête de la carte
        const headerContent = `
            <div class="p-4 border-b border-gray-200">
                <div class="flex justify-between items-start">
                    <div>
                        <h5 class="text-xl font-semibold text-gray-800 mb-2">
                            ${item["Nom de l'organisation"] || "Organisation non spécifiée"}
                        </h5>
                        <p class="text-sm text-gray-600">
                            ${item["Rôle"] || "Rôle non spécifié"}
                        </p>
                    </div>
                    <button class="toggle-details px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors duration-200">
                        Lire plus
                    </button>
                </div>
            </div>`;

        // Construction du corps de la carte (initialement caché)
        const bodyContent = `
            <div class="card-body hidden p-4 bg-gray-50">
                <div class="grid grid-cols-1 gap-4">
                    ${Object.entries(item).map(([key, value]) => {
                        if (key !== "Nom de l'organisation" && key !== "Rôle") {
                            return `
                                <div class="border-b border-gray-200 pb-2">
                                    <span class="font-semibold text-gray-700">${key}: </span>
                                    <span class="text-gray-600">${value || "Non renseigné"}</span>
                                </div>`;
                        }
                        return '';
                    }).join('')}
                    <button class="toggle-details w-full mt-4 px-4 py-2 bg-gray-600 text-white rounded-md hover:bg-gray-700 transition-colors duration-200">
                        Lire moins
                    </button>
                </div>
            </div>`;

        card.innerHTML = headerContent + bodyContent;
        container.appendChild(card);

        // Ajout des événements pour les boutons
        const toggleButtons = card.querySelectorAll('.toggle-details');
        const cardBody = card.querySelector('.card-body');

        toggleButtons.forEach(button => {
            button.addEventListener('click', () => {
                cardBody.classList.toggle('hidden');
                toggleButtons.forEach(btn => {
                    btn.textContent = cardBody.classList.contains('hidden') ? 'Lire plus' : 'Lire moins';
                });
            });
        });
    });
}

function createSearchBar() {
    const searchContainer = document.createElement('div');
    searchContainer.className = 'mb-6 p-4 bg-white rounded-lg shadow-md';
    searchContainer.innerHTML = `
        <div class="relative">
            <input 
                type="text" 
                placeholder="Rechercher..." 
                class="w-full p-3 pl-10 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
            <svg class="w-5 h-5 text-gray-400 absolute left-3 top-1/2 transform -translate-y-1/2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
        </div>
    `;
    
    const dataContainer = document.getElementById('data-cards');
    dataContainer.parentNode.insertBefore(searchContainer, dataContainer);
    
    const searchInput = searchContainer.querySelector('input');
    searchInput.addEventListener('input', (e) => filterData(e.target.value));
}

function filterData(searchTerm) {
    if (!searchTerm) {
        displayCards(allData);
        return;
    }
    
    const filteredData = allData.filter(item => {
        return Object.values(item).some(value => 
            value?.toString().toLowerCase().includes(searchTerm.toLowerCase())
        );
    });
    
    displayCards(filteredData);
}

$(document).ready(function() {
    $("#data-cards").html(`
        <div class="flex items-center justify-center p-8">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
            <span class="ml-3 text-gray-600">Chargement des données...</span>
        </div>
    `);
    
    createSearchBar();
    
    d3.csv(CONFIG.csvUrl).then(data => {
        allData = data;
        displayCards(data);
    }).catch(error => {
        console.error("Erreur lors du chargement des données :", error);
        $("#data-cards").html(`
            <div class="text-center p-8">
                <div class="text-red-500 text-xl">
                    <svg class="w-16 h-16 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                    </svg>
                    Erreur lors du chargement des données
                </div>
            </div>
        `);
    });
});
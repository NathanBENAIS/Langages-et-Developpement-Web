let map;

function initMap() {
    if (!document.getElementById('map')) {
        console.error("L'élément 'map' n'existe pas dans le DOM");
        return;
    }

    map = L.map('map').setView([46.603354, 1.888334], 6); // Vue centrée sur la France

    L.tileLayer('https://stamen-tiles-{s}.a.ssl.fastly.net/toner-lite/{z}/{x}/{y}{r}.png', {
        attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
        subdomains: 'abcd',
        minZoom: 0,
        maxZoom: 20,
        ext: 'png'
    }).addTo(map);

    if (window.allData && window.allData.length > 0) {
        updateMap(window.allData);
    }
}

function updateMap(data) {
    if (!map) {
        console.error("La carte n'est pas initialisée");
        return;
    }

    // Supprimez les marqueurs existants
    map.eachLayer((layer) => {
        if (layer instanceof L.Marker) {
            map.removeLayer(layer);
        }
    });

    // Ajoutez les nouveaux marqueurs
    data.forEach(row => {
        const address = row["Adresse\n"];
        if (!address) return;

        fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(address)}`)
            .then(response => response.json())
            .then(location => {
                if (location.length > 0) {
                    const lat = parseFloat(location[0].lat);
                    const lon = parseFloat(location[0].lon);

                    if (!isNaN(lat) && !isNaN(lon)) {
                        L.marker([lat, lon]).addTo(map)
                            .bindPopup(`<strong>${row["Nom de l'organisation / entité "]}</strong><br>${address}`);
                    }
                }
            })
            .catch(err => console.error('Erreur de géocodage:', err));
    });
}

// Assurez-vous que la carte est initialisée lorsque l'onglet "Carte interactive" est cliqué
document.addEventListener('DOMContentLoaded', () => {
    const mapTab = document.querySelector('.nav-link[href="#"]');
    if (mapTab) {
        mapTab.addEventListener('click', () => {
            if (!map) {
                initMap();
            }
            // Assurez-vous que la carte est visible
            document.getElementById('map').style.display = 'block';
            // Forcez la mise à jour de la taille de la carte
            map.invalidateSize();
        });
    }
});
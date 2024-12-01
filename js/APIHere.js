// Clé API HERE
const API_KEY = "KeQeCfTmL9d4HtGvLUxTjwYf2EUJB5Ca42Hnxq3jxS4";

// Facteurs d'émission en g CO2e/km
const EMISSION_FACTORS = {
    car: {
        essence: 220,    // Moyenne pour une voiture essence
        diesel: 180,     // Moyenne pour une voiture diesel
        hybride: 100,    // Moyenne pour une voiture hybride
        electrique: 15   // Moyenne pour une voiture électrique (émissions indirectes)
    },
    publicTransit: 30,   // Moyenne pour les transports en commun 
    bicycle: 7,         // Vélo mécanique
    pedestrian: 1       // Marche
};

// Fonction pour décoder le polyline flexible de HERE
// Source: https://github.com/heremaps/flexible-polyline
function decodeFlexiblePolyline(encoded) {
    if (!encoded || encoded.length === 0) return [];

    let index = 0;
    let lat = 0;
    let lng = 0;
    const coordinates = [];
    
    while (index < encoded.length) {
        // Décodage simplifié - pour une implémentation complète, utilisez la bibliothèque officielle
        let shift = 0;
        let result = 0;
        
        do {
            let b = encoded.charCodeAt(index++) - 63;
            result |= (b & 0x1f) << shift;
            shift += 5;
        } while (result & 0x20);
        
        lat += ((result & 1) ? ~(result >> 1) : (result >> 1));
        
        shift = 0;
        result = 0;
        
        do {
            let b = encoded.charCodeAt(index++) - 63;
            result |= (b & 0x1f) << shift;
            shift += 5;
        } while (result & 0x20);
        
        lng += ((result & 1) ? ~(result >> 1) : (result >> 1));
        
        coordinates.push([lat / 100000.0, lng / 100000.0]);
    }
    
    return coordinates;
}

// Fonction pour calculer la distance entre deux points en km
function calculateDistance(lat1, lon1, lat2, lon2) {
    const R = 6371; // Rayon de la Terre en km
    const dLat = (lat2 - lat1) * Math.PI / 180;
    const dLon = (lon2 - lon1) * Math.PI / 180;
    const a = Math.sin(dLat/2) * Math.sin(dLat/2) +
        Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
        Math.sin(dLon/2) * Math.sin(dLon/2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    return R * c;
}

// Fonction pour calculer la distance totale d'un polyline
function calculatePolylineDistance(polyline) {
    const coordinates = decodeFlexiblePolyline(polyline);
    let totalDistance = 0;
    
    for (let i = 1; i < coordinates.length; i++) {
        totalDistance += calculateDistance(
            coordinates[i-1][0], coordinates[i-1][1],
            coordinates[i][0], coordinates[i][1]
        );
    }
    
    return totalDistance * 1000; // Convertir en mètres
}

// Fonction pour calculer le bilan carbone
function calculateCarbonFootprint(distance, mode, fuelType = null) {
    if (mode === 'car' && fuelType) {
        return (distance * EMISSION_FACTORS.car[fuelType]).toFixed(1);
    }
    return (distance * EMISSION_FACTORS[mode]).toFixed(1);
}

// Fonction pour mettre à jour l'affichage du bilan carbone
function updateCarbonDisplay(modeId, carbonFootprint) {
    const carbonElement = document.getElementById(`${modeId}_carbon`);
    if (carbonElement) {
        let carbonClass;
        if (carbonFootprint > 1500) {
            carbonClass = 'text-red-600';    // Rouge si > 1500 g CO2e
        } else if (carbonFootprint >= 800) {
            carbonClass = 'text-yellow-600'; // Jaune si entre 800 et 1499 g CO2e
        } else {
            carbonClass = 'text-green-600';  // Vert si < 800 g CO2e
        }
            
        carbonElement.className = `text-sm font-medium ${carbonClass}`;
        carbonElement.textContent = `Émissions CO2 : ${carbonFootprint} g CO2e`;
    }
}

// Fonction pour calculer l'itinéraire en transport en commun
async function calculateTransitRoute(originCoords, destinationCoords) {
    const transitUrl = `https://transit.router.hereapi.com/v8/routes` +
        `?origin=${originCoords.lat},${originCoords.lng}` +
        `&destination=${destinationCoords.lat},${destinationCoords.lng}` +
        `&return=polyline,intermediate` +
        `&apiKey=${API_KEY}`;

    try {
        const response = await fetch(transitUrl);
        const data = await response.json();
        
        if (data.routes && data.routes.length > 0) {
            const route = data.routes[0];
            let totalLength = 0;
            let totalDuration = 0;
            const sections = [];
            
            // Parcourir toutes les sections du trajet
            for (const section of route.sections) {
                if (section.polyline) {
                    const sectionLength = calculatePolylineDistance(section.polyline);
                    totalLength += sectionLength;
                }
                
                const departure = new Date(section.departure.time);
                const arrival = new Date(section.arrival.time);
                const duration = (arrival - departure) / 1000 / 60;
                totalDuration += duration;
                
                const modeName = section.type === 'transit' ? 
                    (section.transport.name || section.transport.mode) : 
                    section.type;
                
                sections.push({
                    mode: section.type,
                    name: modeName,
                    duration: Math.round(duration)
                });
            }
            
            const carbonFootprint = calculateCarbonFootprint(totalLength / 1000, 'publicTransit');
            
            return {
                distance: (totalLength / 1000).toFixed(2),
                duration: Math.round(totalDuration),
                sections: sections,
                carbonFootprint: carbonFootprint
            };
        }
        throw new Error('Aucun itinéraire trouvé');
        
    } catch (error) {
        console.error("Erreur transit:", error);
        return {
            distance: "0.0",
            duration: "0",
            sections: [{mode: "error", name: "Erreur de calcul", duration: 0}],
            carbonFootprint: "0.0"
        };
    }
}

// Fonction pour calculer un itinéraire pour un mode donné
async function calculateRouteForMode(originCoords, destinationCoords, mode) {
    if (mode === 'publicTransit') {
        return await calculateTransitRoute(originCoords, destinationCoords);
    }

    const routeUrl = `https://router.hereapi.com/v8/routes` +
        `?transportMode=${mode}` +
        `&origin=${originCoords.lat},${originCoords.lng}` +
        `&destination=${destinationCoords.lat},${destinationCoords.lng}` +
        `&return=summary,polyline` +
        `&apiKey=${API_KEY}`;

    try {
        const response = await fetch(routeUrl);
        const data = await response.json();

        if (data.routes && data.routes.length > 0) {
            const route = data.routes[0].sections[0];
            const distance = (route.summary.length / 1000).toFixed(2);
            
            let carbonFootprint;
            if (mode === 'car') {
                const fuelType = document.getElementById('fuel_type').value;
                carbonFootprint = calculateCarbonFootprint(parseFloat(distance), mode, fuelType);
            } else {
                carbonFootprint = calculateCarbonFootprint(parseFloat(distance), mode);
            }
            
            return {
                distance,
                duration: Math.round(route.summary.duration / 60),
                carbonFootprint
            };
        }
        return null;
    } catch (error) {
        console.error(`Erreur pour le mode ${mode}:`, error);
        return null;
    }
}
// Fonction principale pour calculer tous les itinéraires
async function calculateAllRoutes() {
    const origin = document.getElementById("depart").value;
    const destination = document.getElementById("arrivee").value;

    if (!origin || !destination) {
        alert("Veuillez saisir le point de départ et le point d'arrivée.");
        return;
    }

    try {
        // Géocodage des adresses
        const originResponse = await fetch(
            `https://geocode.search.hereapi.com/v1/geocode?q=${encodeURIComponent(origin)}&apiKey=${API_KEY}`
        );
        const destinationResponse = await fetch(
            `https://geocode.search.hereapi.com/v1/geocode?q=${encodeURIComponent(destination)}&apiKey=${API_KEY}`
        );

        const originData = await originResponse.json();
        const destinationData = await destinationResponse.json();

        if (!originData.items?.[0] || !destinationData.items?.[0]) {
            alert("Impossible de trouver les adresses spécifiées.");
            return;
        }

        const originCoords = originData.items[0].position;
        const destinationCoords = destinationData.items[0].position;

        // Configuration des modes de transport
        const modes = [
            {id: 'car', name: 'car'},
            {id: 'transit', name: 'publicTransit'},
            {id: 'bicycle', name: 'bicycle'},
            {id: 'pedestrian', name: 'pedestrian'}
        ];

        // Calcul des itinéraires pour chaque mode
        for (const mode of modes) {
            const result = await calculateRouteForMode(originCoords, destinationCoords, mode.name);
            if (result) {
                if (mode.id === 'transit' && result.sections) {
                    const transitDetails = result.sections.map(section => 
                        `${section.mode.toUpperCase()}${section.name ? ` (${section.name})` : ''} : ${section.duration} min`
                    ).join('<br>');

                    document.getElementById(`${mode.id}_distance`).innerHTML = `
                        Distance : ${result.distance} km<br>
                        <span class="text-xs text-gray-500">Détails du trajet:<br>${transitDetails}</span>
                    `;
                } else {
                    document.getElementById(`${mode.id}_distance`).textContent = 
                        `Distance : ${result.distance} km`;
                }
                
                document.getElementById(`${mode.id}_duration`).textContent = 
                    `Durée : ${result.duration} min`;
                    
                updateCarbonDisplay(mode.id, result.carbonFootprint);
            }
        }
    } catch (error) {
        console.error("Erreur lors de la requête:", error);
        alert("Une erreur est survenue lors du calcul des itinéraires.");
    }
}
// Clé API OpenWeather
const API_WEATHER_KEY = '3b4dea559255933b094e3584cf642921';

// Coordonnées de Paris
const PARIS_COORDS = {
    lat: 48.8566,
    lon: 2.3522
};

// Fonction pour charger les données météo au démarrage
async function loadDefaultWeather() {
    try {
        showLoading();
        const cityInput = document.getElementById('cityInput');
        if (cityInput) {
            cityInput.value = 'Paris';
        }
        
        // Utiliser directement les coordonnées de Paris
        const weatherData = await getCurrentWeather(PARIS_COORDS.lat, PARIS_COORDS.lon);
        const forecastData = await getForecast(PARIS_COORDS.lat, PARIS_COORDS.lon);
        
        // Mettre à jour l'affichage
        updateWeatherDisplay(weatherData);
        updateForecastDisplay(forecastData);
        updateRecommendations(weatherData);
        
        // Afficher les conteneurs
        ['currentWeather', 'recommendations', 'forecast'].forEach(id => {
            const element = document.getElementById(id);
            if (element) element.classList.remove('hidden');
        });
    } catch (error) {
        console.error('Erreur lors du chargement des données par défaut:', error);
        showAlert('Erreur lors du chargement des données par défaut');
    } finally {
        hideLoading();
    }
}

// Fonction pour obtenir la météo actuelle
async function getCurrentWeather(lat, lon) {
    const currentWeatherUrl = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&units=metric&lang=fr&appid=${API_WEATHER_KEY}`;
    const response = await fetch(currentWeatherUrl);
    
    if (!response.ok) {
        throw new Error(`Erreur API météo: ${response.status}`);
    }
    
    return await response.json();
}

// Fonction pour obtenir les prévisions
async function getForecast(lat, lon) {
    const forecastUrl = `https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&units=metric&lang=fr&appid=${API_WEATHER_KEY}`;
    const response = await fetch(forecastUrl);
    
    if (!response.ok) {
        throw new Error(`Erreur API prévisions: ${response.status}`);
    }
    
    return await response.json();
}

// Fonction pour obtenir les données météo
async function getWeather() {
    showLoading();
    const city = document.getElementById('cityInput')?.value || 'Paris';
    
    if (!city) {
        showAlert('Veuillez entrer une ville');
        hideLoading();
        return;
    }
    
    try {
        // Obtenir les coordonnées de la ville
        const geoUrl = `https://api.openweathermap.org/geo/1.0/direct?q=${encodeURIComponent(city)}&limit=1&appid=${API_WEATHER_KEY}`;
        const geoResponse = await fetch(geoUrl);
        
        if (!geoResponse.ok) {
            throw new Error(`Erreur API: ${geoResponse.status}`);
        }
        
        const geoData = await geoResponse.json();
        
        if (!geoData || geoData.length === 0) {
            throw new Error('Ville non trouvée');
        }

        const { lat, lon } = geoData[0];
        
        // Obtenir la météo et les prévisions
        const weatherData = await getCurrentWeather(lat, lon);
        const forecastData = await getForecast(lat, lon);
        
        // Mettre à jour l'affichage
        updateWeatherDisplay(weatherData);
        updateForecastDisplay(forecastData);
        updateRecommendations(weatherData);
        
        // Afficher les conteneurs
        ['currentWeather', 'recommendations', 'forecast'].forEach(id => {
            const element = document.getElementById(id);
            if (element) element.classList.remove('hidden');
        });
        
    } catch (error) {
        console.error('Erreur:', error);
        showAlert(error.message || 'Erreur lors de la récupération des données météo');
    } finally {
        hideLoading();
    }
}

// Fonction pour mettre à jour l'affichage de la météo actuelle
function updateWeatherDisplay(data) {
    if (!data) return;
    
    const elements = {
        'cityName': data.name,
        'temperature': `${Math.round(data.main.temp)}°C`,
        'description': data.weather[0].description,
        'humidity': `${data.main.humidity}%`,
        'wind': `${Math.round(data.wind.speed * 3.6)} km/h`,
        'feels': `${Math.round(data.main.feels_like)}°C`
    };
    
    for (const [id, value] of Object.entries(elements)) {
        const element = document.getElementById(id);
        if (element) {
            element.textContent = value;
        }
    }
    
    const weatherIcon = document.getElementById('weatherIcon');
    if (weatherIcon) {
        weatherIcon.src = `https://openweathermap.org/img/wn/${data.weather[0].icon}@2x.png`;
        weatherIcon.alt = data.weather[0].description;
    }
}

// Fonction pour mettre à jour l'affichage des prévisions
function updateForecastDisplay(data) {
    const container = document.getElementById('forecastContainer');
    if (!container) return;
    
    container.innerHTML = '';
    
    // Prendre une prévision par jour (à 12h)
    const dailyForecasts = data.list
        .filter(item => item.dt_txt.includes('12:00:00'))
        .slice(0, 5);
    
    dailyForecasts.forEach(day => {
        const date = new Date(day.dt * 1000);
        const dayName = date.toLocaleDateString('fr-FR', { weekday: 'short' });
        
        container.innerHTML += `
            <div class="bg-white rounded-lg p-4 text-center shadow">
                <p class="font-semibold">${dayName}</p>
                <img src="https://openweathermap.org/img/wn/${day.weather[0].icon}@2x.png" 
                     alt="${day.weather[0].description}"
                     class="w-16 h-16 mx-auto">
                <p class="text-lg font-bold">${Math.round(day.main.temp)}°C</p>
                <p class="text-sm text-gray-600">${day.weather[0].description}</p>
            </div>
        `;
    });
}

// Fonction pour mettre à jour les recommandations
function updateRecommendations(weatherData) {
    const temp = weatherData.main.temp;
    const weather = weatherData.weather[0].main.toLowerCase();
    const wind = weatherData.wind.speed * 3.6; // m/s to km/h
    const recommendations = [];

    // Recommandations basées sur la température
    if (temp < 5) {
        recommendations.push({
            icon: '🥶',
            text: 'Températures très basses, privilégiez les transports couverts',
            transport: 'Voiture ou transports en commun recommandés'
        });
    } else if (temp > 28) {
        recommendations.push({
            icon: '🌡️',
            text: 'Fortes chaleurs, évitez les efforts intenses',
            transport: 'Privilégiez les transports climatisés'
        });
    }

    // Recommandations basées sur la météo
    if (weather.includes('rain') || weather.includes('snow')) {
        recommendations.push({
            icon: '🌧️',
            text: 'Précipitations en cours',
            transport: 'Évitez le vélo et la marche'
        });
    } else if (weather.includes('clear')) {
        recommendations.push({
            icon: '☀️',
            text: 'Temps idéal pour les mobilités douces',
            transport: 'Privilégiez le vélo ou la marche'
        });
    }

    // Recommandations basées sur le vent
    if (wind > 30) {
        recommendations.push({
            icon: '💨',
            text: 'Vents forts',
            transport: 'Évitez le vélo'
        });
    }

    // Si aucune recommandation spécifique n'a été ajoutée
    if (recommendations.length === 0) {
        recommendations.push({
            icon: '✨',
            text: 'Conditions météorologiques modérées',
            transport: 'Tous les modes de transport sont adaptés'
        });
    }

    const container = document.getElementById('transportRecommendations');
    if (container) {
        container.innerHTML = recommendations.map(rec => `
            <div class="flex items-start space-x-3 bg-white p-3 rounded-lg shadow-sm">
                <span class="text-2xl">${rec.icon}</span>
                <div>
                    <p class="font-medium">${rec.text}</p>
                    <p class="text-sm text-gray-600">${rec.transport}</p>
                </div>
            </div>
        `).join('');
    }
}

// Fonction pour afficher le loader
function showLoading() {
    const loader = document.getElementById('loading-container');
    if (loader) loader.style.display = 'flex';
}

// Fonction pour cacher le loader
function hideLoading() {
    const loader = document.getElementById('loading-container');
    if (loader) loader.style.display = 'none';
}

// Fonction pour afficher une alerte
function showAlert(message) {
    const alertBox = document.getElementById('alertBox');
    if (!alertBox) return;
    
    alertBox.textContent = message;
    alertBox.className = 'fixed top-4 right-4 bg-red-100 text-red-700 p-4 rounded z-50';
    alertBox.style.display = 'block';
    
    setTimeout(() => {
        alertBox.style.display = 'none';
    }, 3000);
}

// Initialisation une fois le DOM chargé
document.addEventListener('DOMContentLoaded', function() {
    // Ajouter l'écouteur d'événements pour la touche Entrée
    const cityInput = document.getElementById('cityInput');
    if (cityInput) {
        cityInput.addEventListener('keypress', function(event) {
            if (event.key === 'Enter') {
                getWeather();
            }
        });
    }
    
    // Charger Paris par défaut
    loadDefaultWeather();
});
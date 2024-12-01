import { authInstance as a } from './config.js';
import { ToastManager } from "./toastManager.js";



const toast = new ToastManager();

// Variables globales pour le dashboard
let globalChartData = null;
let isChartInitialized = false;

// Fonction pour vérifier l'authentification avant de charger les données
async function checkAuthentication() {
    const userStr = localStorage.getItem('user');
    if (!userStr) {
        toast.show("Veuillez vous connecter pour accéder au dashboard", "error");
        return false;
    }
    return true;
}

// Fonction pour rechercher les trajets d'un utilisateur
function findUserTrajets(userId) {
    return new Promise((resolve, reject) => {
        try {
            const query = `resource_class_id[]=114`;  // ID de la classe Trajet
            
            console.log("Query construite:", query);
            
            a.omk.searchItems(query, (response) => {
                console.log("Réponse recherche initiale:", response);
                
                if (response && response.length > 0) {
                    const trajets = response.filter(item => {
                        if (item['@type'].includes('fup8:Trajet') && item['fup8:possedeTrajet']) {
                            try {
                                return item['fup8:possedeTrajet'].some(trajet => {
                                    const trajetData = JSON.parse(trajet['@value']);
                                    return trajetData['o:id'] === userId;
                                });
                            } catch (e) {
                                console.error("Erreur parsing trajet:", e);
                                return false;
                            }
                        }
                        return false;
                    });
                    
                    console.log("Trajets filtrés pour l'utilisateur:", trajets);
                    resolve(trajets);
                } else {
                    console.log("Aucun trajet trouvé");
                    resolve([]);
                }
            });
        } catch (error) {
            console.error("Erreur lors de la recherche des trajets:", error);
            reject(error);
        }
    });
}

// Fonction de traitement des données
function processData(data, selectedRoute) {
    console.log("=== Traitement des données ===");
    console.log("Données brutes:", data[0]);
    
    if (selectedRoute !== "all") {
        data = data.filter((d) => d["Nom du trajet"] === selectedRoute);
    }
    
    if (data.length === 0) return [];
    
    const extractNumber = (value, key) => {
        console.log(`Extraction pour ${key}:`, value);
        const parsed = parseFloat(value);
        console.log(`Résultat parsing ${key}:`, parsed);
        return isNaN(parsed) ? 0 : parsed;
    };
    
    let processedData = [];
    
    if (selectedRoute === "all") {
        processedData = [
            {
                mode: "Voiture",
                time: d3.mean(data, d => extractNumber(d["Durée estimée en voiture (minutes)"], "temps voiture")),
                co2: d3.mean(data, d => extractNumber(d['Estimation des émissions de CO₂ par la voiture'], "co2 voiture"))
            },
            {
                mode: "Transport en commun",
                time: d3.mean(data, d => extractNumber(d["Durée estimée en Transport en Commum (minutes)"], "temps TC")),
                co2: d3.mean(data, d => extractNumber(d['Estimation des émissions de CO₂ par les Transport en Commum'], "co2 TC"))
            },
            {
                mode: "À pied",
                time: d3.mean(data, d => extractNumber(d["Durée estimée à pied (minutes)"], "temps pied")),
                co2: d3.mean(data, d => extractNumber(d['Estimation des émissions de CO₂ à pied'], "co2 pied"))
            },
            {
                mode: "Vélo",
                time: d3.mean(data, d => extractNumber(d["Durée estimée à vélo (minutes)"], "temps vélo")),
                co2: d3.mean(data, d => extractNumber(d['Estimation des émissions de CO₂ par le vélo'], "co2 vélo"))
            }
        ];
    } else {
        const routeData = data[0];     
        
        processedData = [
            {
                mode: "Voiture",
                time: extractNumber(routeData["Durée estimée en voiture (minutes)"], "temps voiture"),
                co2: extractNumber(routeData['Estimation des émissions de CO₂ par la voiture'], "co2 voiture")
            },
            {
                mode: "Transport en commun",
                time: extractNumber(routeData["Durée estimée en Transport en Commum (minutes)"], "temps TC"),
                co2: extractNumber(routeData['Estimation des émissions de CO₂ par les Transport en Commum'], "co2 TC")
            },
            {
                mode: "Vélo",
                time: extractNumber(routeData["Durée estimée à vélo (minutes)"], "temps vélo"),
                co2: extractNumber(routeData['Estimation des émissions de CO₂ par le vélo'], "co2 vélo")
            },
            {
                mode: "À pied",
                time: extractNumber(routeData["Durée estimée à pied (minutes)"], "temps pied"),
                co2: extractNumber(routeData['Estimation des émissions de CO₂ à pied'], "co2 pied")
            }
        ];
    }
    
    return processedData
        .filter(d => {
            console.log(`Filtrage ${d.mode}: time=${d.time}, co2=${d.co2}`);
            return !isNaN(d.time) && !isNaN(d.co2);
        })
        .map(d => ({
            ...d,
            time: Math.round(d.time * 10) / 10,
            co2: Math.round(d.co2)
        }));    
}

function extractTrajetDetails(trajet) {
    console.log("Extraction des détails du trajet:", trajet);
    
    const details = {
        id: trajet['o:id'],
        nom: '',
        depart: '',
        arrivee: '',
        voiture: null,
        transportEnCommun: null,
        velo: null,
        marche: null
    };

    try {
        if (trajet['fup8:nomTrajet'] && trajet['fup8:nomTrajet'][0]) {
            details.nom = trajet['fup8:nomTrajet'][0]['@value'];
        }
        if (trajet['fup8:pointDepart'] && trajet['fup8:pointDepart'][0]) {
            details.depart = trajet['fup8:pointDepart'][0]['@value'];
        }
        if (trajet['fup8:pointArrivee'] && trajet['fup8:pointArrivee'][0]) {
            details.arrivee = trajet['fup8:pointArrivee'][0]['@value'];
        }
        if (trajet['fup8:contientVoiture'] && trajet['fup8:contientVoiture'][0]) {
            details.voiture = JSON.parse(trajet['fup8:contientVoiture'][0]['@value']);
        }
        if (trajet['fup8:contientTransportEnCommun'] && trajet['fup8:contientTransportEnCommun'][0]) {
            details.transportEnCommun = JSON.parse(trajet['fup8:contientTransportEnCommun'][0]['@value']);
        }
        if (trajet['fup8:contientVelo'] && trajet['fup8:contientVelo'][0]) {
            details.velo = JSON.parse(trajet['fup8:contientVelo'][0]['@value']);
        }
        if (trajet['fup8:contientMarche'] && trajet['fup8:contientMarche'][0]) {
            details.marche = JSON.parse(trajet['fup8:contientMarche'][0]['@value']);
        }
    } catch (e) {
        console.error("Erreur lors de l'extraction des détails:", e);
    }

    console.log("Détails extraits:", details);
    return details;
}

function createChart(selectedRoute) {
    if (!globalChartData) return;

    const chartData = processData(globalChartData, selectedRoute);

    if (chartData.length === 0) {
        document.getElementById("transport-chart").innerHTML = `
            <div class="text-center text-gray-500 py-8">
                Aucune donnée disponible pour ce trajet
            </div>
        `;
        return;
    }

  const margin = { top: 40, right: 120, bottom: 60, left: 150 };
  const chartContainer = document.getElementById("transport-chart");
  const width = chartContainer.clientWidth - margin.left - margin.right;
  const height = Math.max(200, chartData.length * 80) - margin.top - margin.bottom;

  d3.select("#transport-chart").html("");

  const svg = d3
      .select("#transport-chart")
      .append("svg")
      .attr("width", "100%")
      .attr("height", "100%")
      .attr("viewBox", `0 0 ${width + margin.left + margin.right} ${height + margin.top + margin.bottom}`)
      .append("g")
      .attr("transform", `translate(${margin.left},${margin.top})`);

  // Échelles
  const y = d3
      .scaleBand()
      .domain(chartData.map(d => d.mode))
      .range([0, height])
      .padding(0.3);

  const x = d3
      .scaleLinear()
      .domain([0, d3.max(chartData, d => d.time)])
      .range([0, width]);

  // Couleurs basées sur les valeurs CO2
  const colorScale = d3
      .scaleLinear()
      .domain([0, d3.max(chartData, d => d.co2)])
      .range(["#48BB78", "#F56565"]); // Vert à Rouge

  // Grille verticale
  svg.selectAll("grid-line-vertical")
      .data(x.ticks(5))
      .enter()
      .append("line")
      .attr("x1", d => x(d))
      .attr("x2", d => x(d))
      .attr("y1", 0)
      .attr("y2", height)
      .attr("stroke", "#e0e0e0")
      .attr("stroke-dasharray", "3,3");

  // Barres horizontales
  const bars = svg.selectAll(".bar")
      .data(chartData)
      .enter()
      .append("rect")
      .attr("class", "bar")
      .attr("y", d => y(d.mode))
      .attr("x", 0)
      .attr("height", y.bandwidth())
      .attr("width", d => x(d.time))
      .attr("fill", d => colorScale(d.co2))
      .attr("rx", 6)
      .attr("ry", 6);

  // Axes
  svg.append("g")
      .attr("transform", `translate(0,${height})`)
      .call(d3.axisBottom(x).ticks(5))
      .append("text")
      .attr("x", width / 2)
      .attr("y", 40)
      .attr("fill", "currentColor")
      .attr("text-anchor", "middle")
      .attr("font-size", "14px")
      .text("Temps (minutes)");

  svg.append("g")
      .call(d3.axisLeft(y));

  // Labels sur les barres
  chartData.forEach(d => {
      svg.append("text")
          .attr("x", x(d.time) + 5)
          .attr("y", y(d.mode) + y.bandwidth() / 2)
          .attr("dy", "0.35em")
          .attr("fill", "#666")
          .attr("font-size", "12px")
          .text(`${d.time} min | ${d.co2} g CO₂`);
  });

  // Légende pour l'échelle de CO2
  const legendWidth = 200;
  const legendHeight = 15;
  
  const legendScale = d3.scaleLinear()
      .domain(colorScale.domain())
      .range([0, legendWidth]);
      
  const legendAxis = d3.axisBottom(legendScale)
      .ticks(5)
      .tickFormat(d => `${d}g`);

  const legend = svg.append("g")
      .attr("transform", `translate(${width - legendWidth}, -30)`);

  const defs = svg.append("defs");
  const linearGradient = defs.append("linearGradient")
      .attr("id", "co2-gradient")
      .attr("x1", "0%")
      .attr("x2", "100%");

  linearGradient.append("stop")
      .attr("offset", "0%")
      .attr("stop-color", colorScale.range()[0]);

  linearGradient.append("stop")
      .attr("offset", "100%")
      .attr("stop-color", colorScale.range()[1]);

  legend.append("rect")
      .attr("width", legendWidth)
      .attr("height", legendHeight)
      .style("fill", "url(#co2-gradient)")
      .attr("rx", 3)
      .attr("ry", 3);

  legend.append("g")
      .attr("transform", `translate(0,${legendHeight})`)
      .call(legendAxis);

  legend.append("text")
      .attr("x", legendWidth / 2)
      .attr("y", -5)
      .attr("text-anchor", "middle")
      .attr("font-size", "12px")
      .text("Échelle d'émissions CO₂");

  // Titre
  svg.append("text")
      .attr("x", width / 2)
      .attr("y", -margin.top / 2)
      .attr("text-anchor", "middle")
      .attr("font-size", "16px")
      .attr("font-weight", "bold")
      .text("Comparaison des modes de transport");
}

async function loadData() {
    if (!await checkAuthentication()) return;

    try {
        const userStr = localStorage.getItem('user');
        const user = JSON.parse(userStr);
        
        try {
            const testResponse = await fetch(a.omk.api);
            if (!testResponse.ok) {
                throw new Error('Erreur de connexion à l\'API Omeka-S');
            }
        } catch (apiError) {
            throw new Error('Impossible de se connecter à l\'API Omeka-S. Vérifiez que le serveur est en cours d\'exécution.');
        }

        const trajets = await findUserTrajets(user.id);
        
        if (!trajets || trajets.length === 0) {
            document.getElementById("transport-chart").innerHTML = `
                <div class="text-center p-8">
                    <div class="text-gray-500 text-xl">
                        Aucun trajet trouvé pour cet utilisateur.
                    </div>
                </div>
            `;
            return;
        }

        globalChartData = trajets.map(trajet => {
            const details = extractTrajetDetails(trajet);
            return {
                "Nom du trajet": details.nom,
                "Durée estimée en voiture (minutes)": details.voiture?.duration || 0,
                "Durée estimée en Transport en Commum (minutes)": details.transportEnCommun?.duration || 0,
                "Durée estimée à vélo (minutes)": details.velo?.duration || 0,
                "Durée estimée à pied (minutes)": details.marche?.duration || 0,
                "Estimation des émissions de CO₂ par la voiture": details.voiture?.carbon || 0,
                "Estimation des émissions de CO₂ par les Transport en Commum": details.transportEnCommun?.carbon || 0,
                "Estimation des émissions de CO₂ par le vélo": details.velo?.carbon || 0,
                "Estimation des émissions de CO₂ à pied": details.marche?.carbon || 0
            };
        });

        setupRouteFilter();
        createChart("all");
        isChartInitialized = true;

    } catch (error) {
        console.error("Erreur lors du chargement des données:", error);
        toast.show(error.message, "error");
        document.getElementById("transport-chart").innerHTML = `
            <div class="text-red-500 text-center">
                <p>Erreur lors du chargement des données</p>
                <p class="text-sm">${error.message}</p>
            </div>
        `;
    }
}

function setupRouteFilter() {
    const uniqueRoutes = [...new Set(globalChartData.map(item => item["Nom du trajet"]))].filter(Boolean);
    const routeFilter = document.getElementById("route-filter");
    
    routeFilter.innerHTML = '<option value="all">Tous les trajets</option>';
    uniqueRoutes.forEach(route => {
        const option = document.createElement("option");
        option.value = route;
        option.textContent = route;
        routeFilter.appendChild(option);
    });

    routeFilter.addEventListener("change", (e) => {
        createChart(e.target.value);
    });
}

function initializeDashboard() {
    if (isChartInitialized) return;

    checkAuthentication().then(isAuthenticated => {
        if (!isAuthenticated) return;

        const dashboardContainer = document.getElementById("dashboard");
        dashboardContainer.innerHTML = `
            <div class="mb-6">
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <label class="block text-sm font-medium text-gray-700 mb-2">Sélectionner un trajet :</label>
                    <select id="route-filter" class="w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <option value="all">Tous les trajets</option>
                    </select>
                </div>
            </div>
            <div class="bg-white p-4 rounded-lg shadow-md mt-4">
                <div id="transport-chart" style="width: 100%; height: 600px;"></div>
            </div>
        `;

        loadData();
    });
}

document.addEventListener("DOMContentLoaded", () => {
    const dashboardTab = document.getElementById("dashboard-tab");
    if (dashboardTab) {
        dashboardTab.addEventListener("click", () => {
            if (!isChartInitialized) {
                initializeDashboard();
            }
        });
    } else {
        initializeDashboard();
    }
});
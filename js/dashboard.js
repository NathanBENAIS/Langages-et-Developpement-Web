// Variables globales pour le dashboard
let globalChartData = null;
let isChartInitialized = false;

// Fonction de test pour vérifier l'accès aux données
function testDataAccess(data) {
    const testData = data[0];
    console.log("=== TEST ACCÈS AUX DONNÉES ===");
    console.log("Données complètes du premier enregistrement:", testData);
    console.log("Valeur CO2 voiture:", testData['Estimation d\'émissions de CO₂ par la voiture']);
    console.log("Valeur CO2 TC:", testData['Estimation d\'émissions de CO₂ par les Transport en Commum']);
    console.log("Valeur CO2 pied:", testData['Estimation d\'émissions de CO₂ à pied']);
    console.log("Valeur CO2 vélo:", testData['Estimation d\'émissions de CO₂ par le vélo']);
}

// Fonction de traitement des données
function processData(data, selectedRoute) {
    console.log("=== Traitement des données ===");
    console.log("Données brutes:", data[0]);
    
    if (selectedRoute !== "all") {
        data = data.filter((d) => d["Nom du trajet"] === selectedRoute);
    }
    
    if (data.length === 0) return [];
    
    // Fonction utilitaire pour extraire les valeurs numériques avec debug
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
                co2: d3.mean(data, d => extractNumber(d['Estimation d\'émissions de CO₂ par le vélo'], "co2 vélo"))
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
    
    console.log("Données avant filtrage:", processedData);
    
    const filteredData = processedData
        .filter(d => {
            console.log(`Filtrage ${d.mode}: time=${d.time}, co2=${d.co2}`);
            return !isNaN(d.time) && !isNaN(d.co2);
        })
        .map(d => ({
            ...d,
            time: Math.round(d.time * 10) / 10,
            co2: Math.round(d.co2)  // Arrondi à l'entier pour les grammes de CO2
        }));    
   
    return filteredData;
}

// Fonction de chargement des données
function loadData() {
    d3.csv(CONFIG.csvUrl)
    .then((data) => {     
        testDataAccess(data);
        globalChartData = data;

        // Remplir le filtre avec les noms de trajets uniques
        const uniqueRoutes = [...new Set(data.map(item => item["Nom du trajet"]))].filter(Boolean);
        const routeFilter = document.getElementById("route-filter");

        uniqueRoutes.forEach(route => {
            const option = document.createElement("option");
            option.value = route;
            option.textContent = route;
            routeFilter.appendChild(option);
        });

        routeFilter.addEventListener("change", (e) => {
            createChart(e.target.value);
        });

        createChart("all");
        isChartInitialized = true;
    })
    .catch((error) => {
        console.error("Erreur lors du chargement des données:", error);
        document.getElementById("transport-chart").innerHTML = `
            <div class="text-red-500 text-center">
                <p>Erreur lors du chargement des données</p>
                <p class="text-sm">${error.message}</p>
            </div>
        `;
    });
}

// Fonction de création du graphique
// Remplacer la fonction createChart par celle-ci :
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

// Fonction d'initialisation du dashboard
function initializeDashboard() {
    if (isChartInitialized) return;

    const dashboardContainer = document.getElementById("dashboard");
    dashboardContainer.innerHTML = "";

    // Filtre
    const filterContainer = document.createElement("div");
    filterContainer.className = "mb-6";
    filterContainer.innerHTML = `
        <div class="bg-white p-4 rounded-lg shadow-md">
            <label class="block text-sm font-medium text-gray-700 mb-2">Sélectionner un trajet :</label>
            <select id="route-filter" class="w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                <option value="all">Tous les trajets</option>
            </select>
        </div>
    `;
    dashboardContainer.appendChild(filterContainer);

    // Graphique
    const chartContainer = document.createElement("div");
    chartContainer.className = "bg-white p-4 rounded-lg shadow-md mt-4";
    chartContainer.innerHTML = `
        <div id="transport-chart" style="width: 100%; height: 600px;"></div>
    `;
    dashboardContainer.appendChild(chartContainer);

    document.getElementById("transport-chart").innerHTML = `
        <div class="flex items-center justify-center h-full">
            <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-500"></div>
            <span class="ml-2">Chargement des données...</span>
        </div>
    `;

    loadData();
}

// Initialisation
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
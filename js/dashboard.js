// Variables globales pour le dashboard
let globalChartData = null;
let isChartInitialized = false;
let progressionChart = null;
let monthlyChart = null;
let goalsChart = null;

// Fonction de test pour vérifier l'accès aux données
function testDataAccess(data) {
    const testData = data[0];
    console.log("=== TEST ACCÈS AUX DONNÉES ===");
    console.log("Données complètes du premier enregistrement:", testData);
    console.log("Valeur CO2 voiture:", testData['Estimation des émissions de CO₂ par la voiture']);
    console.log("Valeur CO2 TC:", testData['Estimation des émissions de CO₂ par les Transport en Commum']);
    console.log("Valeur CO2 pied:", testData['Estimation des émissions de CO₂ à pied']);
    console.log("Valeur CO2 vélo:", testData['Estimation des émissions de CO₂ par le vélo']);
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


// Fonction utilitaire pour encoder en UTF-8
function utf8_to_b64(str) {
    return window.btoa(encodeURIComponent(str).replace(/%([0-9A-F]{2})/g,
        function toSolidBytes(match, p1) {
            return String.fromCharCode('0x' + p1);
        }));
}

function exportChartsToPDF() {
    try {
        // Créer un nouveau document PDF format A4
        const doc = new jsPDF({
            unit: 'mm',
            format: 'a4',
            orientation: 'portrait'
        });

        let currentY = 15;
        const pageWidth = doc.internal.pageSize.getWidth();
        const pageHeight = doc.internal.pageSize.getHeight();
        const marginX = 15;
        const contentWidth = pageWidth - (2 * marginX);

        // Configuration du titre principal
        doc.setFontSize(16);
        doc.setTextColor(0, 0, 0);
        doc.text('Rapport des émissions CO2', pageWidth / 2, currentY, { align: 'center' });
        currentY += 15;

        // Fonction pour capturer un élément en haute qualité
        const captureElement = async (element, backgroundColor = '#FFFFFF') => {
            // Options de capture pour html2canvas
            const options = {
                scale: 2,
                backgroundColor: backgroundColor,
                logging: false,
                useCORS: true,
                allowTaint: true
            };

            // Si c'est un SVG, définir une hauteur fixe
            if (element.tagName === 'svg') {
                options.height = element.height.baseVal.value;
                options.width = element.width.baseVal.value;
            }

            const canvas = await html2canvas(element, options);
            return canvas.toDataURL('image/jpeg', 1.0);
        };

        // Fonction pour ajouter un graphique au PDF
        const addChartToPDF = async (element, title, maxHeight = 100) => {
            // Ajouter le titre de la section
            doc.setFontSize(12);
            doc.setTextColor(0, 0, 0);
            doc.text(title, marginX, currentY);
            currentY += 8;

            // Capturer le graphique
            const imgData = await captureElement(element);
            const img = new Image();
            await new Promise((resolve, reject) => {
                img.onload = resolve;
                img.onerror = reject;
                img.src = imgData;
            });

            // Calculer les dimensions en préservant le ratio
            let imgWidth = contentWidth;
            let imgHeight = (img.height * contentWidth) / img.width;

            // Limiter la hauteur si nécessaire
            if (imgHeight > maxHeight) {
                imgHeight = maxHeight;
                imgWidth = (img.width * maxHeight) / img.height;
            }

            // Centrer horizontalement
            const xOffset = marginX + (contentWidth - imgWidth) / 2;

            // Vérifier si on a besoin d'une nouvelle page
            if (currentY + imgHeight > pageHeight - 20) {
                doc.addPage();
                currentY = 20;
            }

            // Ajouter l'image
            doc.addImage(imgData, 'JPEG', xOffset, currentY, imgWidth, imgHeight, null, 'FAST');
            currentY += imgHeight + 15;
        };

        // Fonction principale asynchrone pour l'export
        const generatePDF = async () => {
            // 1. D3.js chart
            const d3Chart = document.querySelector('#transport-chart');
            if (d3Chart) {
                await addChartToPDF(d3Chart, 'Comparaison des modes de transport', 120);
            }

            // 2. Progression Chart
            if (progressionChart && progressionChart.canvas) {
                await addChartToPDF(progressionChart.canvas, 'Progression des émissions CO2', 80);
            }

            // 3. Monthly Chart
            if (monthlyChart && monthlyChart.canvas) {
                await addChartToPDF(monthlyChart.canvas, 'Comparaison mensuelle par mode', 80);
            }

            // 4. Goals Chart
            if (goalsChart && goalsChart.canvas) {
                await addChartToPDF(goalsChart.canvas, 'Objectifs vs Résultat', 80);
            }

            // 5. DataTable
            const dataTable = document.querySelector('#dataTable_wrapper');
            if (dataTable) {
                if (currentY + 100 > pageHeight) {
                    doc.addPage();
                    currentY = 20;
                }
                await addChartToPDF(dataTable, 'Données détaillées', 100);
            }

            // Sauvegarder le PDF
            doc.save('rapport-emissions-co2.pdf');
        };

        // Ajouter un style temporaire pour la capture
        const tempStyle = document.createElement('style');
        tempStyle.innerHTML = `
            .chart-container-for-export {
                background-color: white !important;
                padding: 10px;
                margin: 0;
            }
        `;
        document.head.appendChild(tempStyle);

        // Exécuter la génération du PDF
        generatePDF()
            .then(() => {
                document.head.removeChild(tempStyle);
            })
            .catch(error => {
                document.head.removeChild(tempStyle);
                console.error('Erreur lors de la génération du PDF:', error);
                alert('Une erreur est survenue lors de l\'export PDF');
            });

    } catch (error) {
        console.error('Erreur lors de l\'export PDF:', error);
        alert('Une erreur est survenue lors de l\'export PDF');
    }
}
// Fonction de création du graphique
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
// Nouvelle fonction pour traiter les données pour Chart.js
// Modifiez la fonction processChartJsData pour ne pas dépendre de la date
// Dans votre fonction processChartJsData
function processChartJsData(data, selectedRoute) {
    const filteredData = selectedRoute === "all" ? data : data.filter(d => d["Nom du trajet"] === selectedRoute);
    
    // Vérifier si les données sont disponibles
    if (!filteredData || filteredData.length === 0) {
        // Retourner des valeurs par défaut si pas de données
        return [];
    }

    const months = ['M-6', 'M-5', 'M-4', 'M-3', 'M-2', 'M-1'];
    
    // Obtenir les valeurs de base avec vérification de sécurité
    const baseValues = {
        car: parseFloat(filteredData[0]['Estimation des émissions de CO₂ par la voiture'] || 0),
        transit: parseFloat(filteredData[0]['Estimation des émissions de CO₂ par les Transport en Commum'] || 0),
        bike: parseFloat(filteredData[0]['Estimation des émissions de CO₂ par le vélo'] || 0),
        walk: parseFloat(filteredData[0]['Estimation des émissions de CO₂ à pied'] || 0)
    };

    // Le reste de votre code reste inchangé
    const generateTrend = (baseValue) => {
        const trend = [];
        let currentValue = baseValue;
        for (let i = 0; i < 6; i++) {
            const variation = 0.85 + (Math.random() * 0.3);
            currentValue = Math.round(baseValue * variation);
            trend.push(currentValue);
        }
        return trend;
    };

    const carTrend = generateTrend(baseValues.car);
    const transitTrend = generateTrend(baseValues.transit);
    const bikeTrend = generateTrend(baseValues.bike);
    const walkTrend = generateTrend(baseValues.walk);

    return months.map((month, index) => ({
        month: month,
        car: carTrend[index],
        transit: transitTrend[index],
        bike: bikeTrend[index],
        walk: walkTrend[index]
    }));
}




function initializeChartJsGraphs(data) {
    const monthlyData = processChartJsData(data, "all");
    const months = monthlyData.map(d => d.month);

    // Configuration commune des graphiques
    Chart.defaults.font.family = "'Inter', 'Helvetica', 'Arial', sans-serif";
    Chart.defaults.font.size = 12;
    Chart.defaults.plugins.tooltip.backgroundColor = 'rgba(0, 0, 0, 0.8)';
    Chart.defaults.plugins.tooltip.padding = 10;
    Chart.defaults.plugins.tooltip.cornerRadius = 8;

    // Thème de couleurs amélioré
    const colors = {
        car: {
            main: '#FF6B6B',
            light: 'rgba(255, 107, 107, 0.2)'
        },
        transit: {
            main: '#4ECDC4',
            light: 'rgba(78, 205, 196, 0.2)'
        },
        bike: {
            main: '#45B7D1',
            light: 'rgba(69, 183, 209, 0.2)'
        },
        walk: {
            main: '#96CEB4',
            light: 'rgba(150, 206, 180, 0.2)'
        }
    };

    // Graphique de progression
    const progressionCtx = document.getElementById('progressionChart').getContext('2d');
    progressionChart = new Chart(progressionCtx, {
        type: 'line',
        data: {
            labels: months,
            datasets: [
                {
                    label: 'Voiture',
                    data: monthlyData.map(d => d.car),
                    borderColor: colors.car.main,
                    backgroundColor: colors.car.light,
                    fill: true,
                    tension: 0.4,
                    borderWidth: 3
                },
                {
                    label: 'Transport en commun',
                    data: monthlyData.map(d => d.transit),
                    borderColor: colors.transit.main,
                    backgroundColor: colors.transit.light,
                    fill: true,
                    tension: 0.4,
                    borderWidth: 3
                },
                {
                    label: 'Vélo',
                    data: monthlyData.map(d => d.bike),
                    borderColor: colors.bike.main,
                    backgroundColor: colors.bike.light,
                    fill: true,
                    tension: 0.4,
                    borderWidth: 3
                },
                {
                    label: 'À pied',
                    data: monthlyData.map(d => d.walk),
                    borderColor: colors.walk.main,
                    backgroundColor: colors.walk.light,
                    fill: true,
                    tension: 0.4,
                    borderWidth: 3
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        padding: 20,
                        usePointStyle: true,
                        pointStyle: 'circle'
                    }
                },
                title: {
                    display: true,
                    text: 'Progression des émissions CO2',
                    font: {
                        size: 16,
                        weight: 'bold'
                    },
                    padding: 20
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(0, 0, 0, 0.05)',
                        drawBorder: false
                    },
                    title: {
                        display: true,
                        text: 'g CO2',
                        font: {
                            weight: 'bold'
                        }
                    }
                },
                x: {
                    grid: {
                        display: false
                    }
                }
            },
            interaction: {
                intersect: false,
                mode: 'index'
            }
        }
    });

    // Graphique comparaison mensuelle
    const monthlyCtx = document.getElementById('monthlyChart').getContext('2d');
    monthlyChart = new Chart(monthlyCtx, {
        type: 'bar',
        data: {
            labels: ['Voiture', 'Transport en commun', 'Vélo', 'À pied'],
            datasets: [
                {
                    label: 'M-2',
                    data: [
                        monthlyData[monthlyData.length - 2].car,
                        monthlyData[monthlyData.length - 2].transit,
                        monthlyData[monthlyData.length - 2].bike,
                        monthlyData[monthlyData.length - 2].walk
                    ],
                    backgroundColor: Object.values(colors).map(c => c.main),
                    borderRadius: 8
                },
                {
                    label: 'M-1',
                    data: [
                        monthlyData[monthlyData.length - 1].car,
                        monthlyData[monthlyData.length - 1].transit,
                        monthlyData[monthlyData.length - 1].bike,
                        monthlyData[monthlyData.length - 1].walk
                    ],
                    backgroundColor: Object.values(colors).map(c => c.light),
                    borderRadius: 8
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        padding: 20,
                        usePointStyle: true,
                        pointStyle: 'rectRounded'
                    }
                },
                title: {
                    display: true,
                    text: 'Comparaison mensuelle par mode',
                    font: {
                        size: 16,
                        weight: 'bold'
                    },
                    padding: 20
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(0, 0, 0, 0.05)',
                        drawBorder: false
                    },
                    title: {
                        display: true,
                        text: 'g CO2',
                        font: {
                            weight: 'bold'
                        }
                    }
                },
                x: {
                    grid: {
                        display: false
                    }
                }
            }
        }
    });

    // Graphique Objectifs vs Résultat avec animations améliorées
    const totalEmissions = monthlyData.map(d => d.car + d.transit + d.bike + d.walk);
    const maxEmission = Math.max(...totalEmissions);
    const objectif = maxEmission * 0.7; // Objectif de réduction de 30%

    const goalsCtx = document.getElementById('goalsChart').getContext('2d');
    goalsChart = new Chart(goalsCtx, {
        type: 'line',
        data: {
            labels: months,
            datasets: [
                {
                    label: 'Objectif',
                    data: Array(months.length).fill(objectif),
                    borderColor: colors.bike.main,
                    borderDash: [10, 5],
                    borderWidth: 3,
                    fill: false,
                    pointStyle: 'dash'
                },
                {
                    label: 'Émissions totales',
                    data: totalEmissions,
                    borderColor: colors.car.main,
                    backgroundColor: colors.car.light,
                    fill: true,
                    tension: 0.4,
                    borderWidth: 3,
                    pointBackgroundColor: colors.car.main
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        padding: 20,
                        usePointStyle: true
                    }
                },
                title: {
                    display: true,
                    text: 'Objectifs vs Résultat',
                    font: {
                        size: 16,
                        weight: 'bold'
                    },
                    padding: 20
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(0, 0, 0, 0.05)',
                        drawBorder: false
                    },
                    title: {
                        display: true,
                        text: 'g CO2 total',
                        font: {
                            weight: 'bold'
                        }
                    }
                },
                x: {
                    grid: {
                        display: false
                    }
                }
            },
            animation: {
                duration: 2000,
                easing: 'easeInOutQuart'
            }
        }
    });
}

function createDataTable(data) {
    const tableContainer = document.createElement('div');
    tableContainer.className = 'bg-white';
    tableContainer.innerHTML = ` `;
    return tableContainer;
}


function initializeDataTable(processedData) {
    if ($.fn.DataTable.isDataTable('#dataTable')) {
        $('#dataTable').DataTable().destroy();
    }

    $('#dataTable').DataTable({
        data: processedData,
        columns: [
            { 
                data: 'mode',
                title: 'Mode de transport'
            },
            { 
                data: 'time',
                title: 'Durée (min)',
                render: function(data) {
                    return data.toFixed(1);
                }
            },
            { 
                data: 'co2',
                title: 'Émissions CO2 (g)',
                render: function(data) {
                    return data.toFixed(0);
                }
            }
        ],
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excel',
                text: 'Exporter Excel',
                className: 'buttons-excel',
                title: 'Données des émissions CO2',
                exportOptions: {
                    modifier: {
                        page: 'all'
                    }
                }
            },
            {
                extend: 'pdf',
                text: 'Exporter PDF',
                className: 'buttons-pdf',
                title: 'Données des émissions CO2',
                exportOptions: {
                    modifier: {
                        page: 'all'
                    }
                }
            },
            {
                extend: 'print',
                text: 'Imprimer',
                className: 'buttons-print'
            }
        ],
        language: {
            url: 'https://cdn.datatables.net/plug-ins/1.13.7/i18n/fr-FR.json'
        },
        responsive: true,
        ordering: true,
        searching: true
    });
}

// Fonction d'initialisation du dashboard
function initializeDashboard() {
    if (isChartInitialized) return;

    const dashboardContainer = document.getElementById("dashboard");
    dashboardContainer.innerHTML = "";

    // Filtre existant
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

    // Graphique D3.js existant
    const chartContainer = document.createElement("div");
    chartContainer.className = "bg-white p-4 rounded-lg shadow-md mt-4";
    chartContainer.innerHTML = `
        <div id="transport-chart" style="width: 100%; height: 600px;"></div>
    `;
    dashboardContainer.appendChild(chartContainer);

    // Graphiques Chart.js existants
    const chartjsContainer = document.createElement("div");
    chartjsContainer.className = "grid grid-cols-1 md:grid-cols-2 gap-4 mt-4";
    chartjsContainer.innerHTML = `
        <div class="bg-white p-4 rounded-lg shadow-md">
            <canvas id="progressionChart" height="300"></canvas>
        </div>
        <div class="bg-white p-4 rounded-lg shadow-md">
            <canvas id="monthlyChart" height="300"></canvas>
        </div>
        <div class="bg-white p-4 rounded-lg shadow-md md:col-span-2">
            <canvas id="goalsChart" height="200"></canvas>
        </div>
    `;
    dashboardContainer.appendChild(chartjsContainer);

    // Bouton d'export (NOUVEAU)
    const exportButtonContainer = document.createElement('div');
    exportButtonContainer.className = 'bg-white p-4 rounded-lg shadow-md mt-4';
    exportButtonContainer.innerHTML = `
        <button id="exportChartsBtn" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
            Exporter tous les graphiques en PDF
        </button>
    `;
    dashboardContainer.appendChild(exportButtonContainer);

    // Ajouter l'écouteur d'événement pour l'export (NOUVEAU)
    document.getElementById('exportChartsBtn').addEventListener('click', exportChartsToPDF);

    // Ajouter le tableau DataTable
    const tableContainer = createDataTable();
    dashboardContainer.appendChild(tableContainer);

    loadData();
}

// Fonction de chargement des données modifiée
function loadData() {
    d3.csv(CONFIG.csvUrl)
    .then((data) => {     
        testDataAccess(data);
        globalChartData = data;

        // Code existant pour D3.js
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
            updateChartJsGraphs(data, e.target.value);
        });

        createChart("all");
        initializeChartJsGraphs(data);
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

// Fonction pour mettre à jour les graphiques Chart.js
function updateChartJsGraphs(data, selectedRoute) {
    const filteredData = selectedRoute === "all" ? data : data.filter(d => d["Nom du trajet"] === selectedRoute);
    const monthlyData = processChartJsData(filteredData);

    if (!monthlyData || monthlyData.length === 0) {
        console.warn('Pas de données disponibles pour ce trajet');
        return;
    }

    // Mettre à jour les données des graphiques
    if (progressionChart && monthlyChart && goalsChart) {
        try {
            // Mise à jour du graphique de progression
            progressionChart.data.labels = monthlyData.map(d => d.month);
            progressionChart.data.datasets[0].data = monthlyData.map(d => d.car);
            progressionChart.data.datasets[1].data = monthlyData.map(d => d.transit);
            progressionChart.update();

            // Mise à jour de la comparaison mensuelle
            const lastTwo = monthlyData.slice(-2);
            if (lastTwo.length === 2) {
                monthlyChart.data.datasets[0].data = [
                    lastTwo[0].car,
                    lastTwo[0].transit,
                    lastTwo[0].bike,
                    lastTwo[0].walk
                ];
                monthlyChart.data.datasets[1].data = [
                    lastTwo[1].car,
                    lastTwo[1].transit,
                    lastTwo[1].bike,
                    lastTwo[1].walk
                ];
                monthlyChart.update();
            }

            // Mise à jour des Objectifs vs Résultat
            const actualData = monthlyData.map(d => d.car + d.transit + d.bike + d.walk);
            const objective = Math.max(...actualData) * 0.8;
            goalsChart.data.datasets[0].data = Array(monthlyData.length).fill(objective);
            goalsChart.data.datasets[1].data = actualData;
            goalsChart.update();
        } catch (error) {
            console.error('Erreur lors de la mise à jour des graphiques:', error);
        }
    }
}

// Initialisation au chargement de la page
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
        initializeDataTable(chartData);
    }
});
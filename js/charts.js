let roleChart, objectiveChart, historyChart;

function initCharts() {
    const commonOptions = {
        responsive: true,
        plugins: {
            legend: {
                position: 'bottom'
            }
        }
    };

    roleChart = new Chart(document.getElementById('roleChart').getContext('2d'), {
        type: 'pie',
        data: {
            labels: [],
            datasets: [{
                data: [],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.8)',
                    'rgba(54, 162, 235, 0.8)',
                    'rgba(255, 206, 86, 0.8)',
                    'rgba(75, 192, 192, 0.8)',
                    'rgba(153, 102, 255, 0.8)',
                ]
            }]
        },
        options: {
            ...commonOptions,
            plugins: {
                ...commonOptions.plugins,
                title: {
                    display: true,
                    text: 'Distribution des rôles'
                }
            }
        }
    });

    objectiveChart = new Chart(document.getElementById('objectiveChart').getContext('2d'), {
        type: 'pie',
        data: {
            labels: [],
            datasets: [{
                data: [],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.8)',
                    'rgba(54, 162, 235, 0.8)',
                    'rgba(255, 206, 86, 0.8)',
                    'rgba(75, 192, 192, 0.8)',
                    'rgba(153, 102, 255, 0.8)',
                ]
            }]
        },
        options: {
            ...commonOptions,
            plugins: {
                ...commonOptions.plugins,
                title: {
                    display: true,
                    text: 'Distribution des objectifs'
                }
            }
        }
    });

    historyChart = new Chart(document.getElementById('historyChart').getContext('2d'), {
        type: 'line',
        data: {
            datasets: [{
                label: 'Nombre cumulatif d\'événements',
                data: [],
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                tension: 0.1,
                pointRadius: 5,
                pointHoverRadius: 8
            }]
        },
        options: {
            ...commonOptions,
            plugins: {
                ...commonOptions.plugins,
                title: {
                    display: true,
                    text: 'Évolution mensuelle du nombre d\'événements'
                }
            },
            scales: {
                x: {
                    type: 'time',
                    time: {
                        unit: 'month',
                        displayFormats: {
                            month: 'MMM yyyy'
                        }
                    },
                    title: {
                        display: true,
                        text: 'Mois'
                    }
                },
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Nombre cumulatif d\'événements'
                    }
                }
            }
        }
    });
}

function updateCharts(data) {
    if (data && data.length > 0) {
        updatePieChart(roleChart, 'Quel est votre rôle dans le projet de mobilité durable ?', data);
        updatePieChart(objectiveChart, 'Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?', data);
    } else {
        console.warn("Aucune donnée disponible pour mettre à jour les graphiques");
    }
}

function updatePieChart(chart, key, data) {
    if (!data || data.length === 0) {
        console.warn("Aucune donnée disponible pour mettre à jour le graphique en camembert");
        return;
    }

    const chartData = {};
    data.forEach(row => {
        const value = row[key];
        if (value) {
            if (value in chartData) {
                chartData[value]++;
            } else {
                chartData[value] = 1;
            }
        }
    });

    chart.data.labels = Object.keys(chartData);
    chart.data.datasets[0].data = Object.values(chartData);
    chart.update();
}

function updateHistoryChart(data) {
    if (!data || data.length === 0) {
        console.warn("Aucune donnée disponible pour mettre à jour le graphique historique");
        return;
    }

    function parseDateTime(dateTimeString) {
        if (!dateTimeString) return null;
        const [datePart, timePart] = dateTimeString.split(' ');
        const [day, month, year] = datePart.split('/');
        const [hours, minutes, seconds] = timePart.split(':');
        return new Date(year, month - 1, day, hours, minutes, seconds);
    }

    data.sort((a, b) => {
        const dateA = parseDateTime(a.Horodateur);
        const dateB = parseDateTime(b.Horodateur);
        return dateA && dateB ? dateA - dateB : 0;
    });


    const chartData = data.reduce((acc, row, index) => {
                    const date = parseDateTime(row.Horodateur);
                    if (date) {
                        acc.push({
                            x: date,
                            y: index + 1 // Nombre cumulatif d'événements
                        });
                    }
                    return acc;
                }, []);
            
                historyChart.data.datasets[0].data = chartData;
            
                historyChart.options.scales.x = {
                    type: 'time',
                    time: {
                        unit: 'day',
                        displayFormats: {
                            day: 'dd/MM/yyyy HH:mm'
                        }
                    },
                    title: {
                        display: true,
                        text: 'Date et Heure'
                    }
                };
            
                historyChart.update();
            }
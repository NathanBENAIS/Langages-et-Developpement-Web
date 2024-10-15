function fillFilters(data) {
    const roles = new Set();
    const objectives = new Set();
    const cities = new Set();

    data.forEach(row => {
        roles.add(row["Quel est votre rôle dans le projet de mobilité durable ?"]);
        objectives.add(row["Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?"]);
        
        const addressParts = row["Adresse\n"].trim().split(",");
        if (addressParts.length > 1) {
            const city = addressParts[1].trim();
            cities.add(city);
        }
    });

    fillSelect("#roleFilter", roles);
    fillSelect("#objectiveFilter", objectives);
    fillSelect("#cityFilter", cities);
}

function fillSelect(selectId, options) {
    const select = $(selectId);
    options.forEach(option => {
        select.append(`<option value="${option}">${option}</option>`);
    });
}

function applyFilters() {
    const selectedRole = $("#roleFilter").val();
    const selectedObjective = $("#objectiveFilter").val();
    const selectedCity = $("#cityFilter").val();

    const filteredData = allData.filter(row => {
        const matchesRole = selectedRole === "" || row["Quel est votre rôle dans le projet de mobilité durable ?"] === selectedRole;
        const matchesObjective = selectedObjective === "" || row["Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?"] === selectedObjective;
        const matchesCity = selectedCity === "" || row["Adresse\n"].split(',')[1]?.trim() === selectedCity;

        return matchesRole && matchesObjective && matchesCity;
    });

    displayCards(filteredData);
    updateMap(filteredData);
    updateCharts(filteredData);
    updateHistoryChart(filteredData);
}
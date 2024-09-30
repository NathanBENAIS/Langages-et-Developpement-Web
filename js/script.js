const csvUrl = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQ6Gvel3BRcW1gwcvjGrEoFi1rQFmAXmMVjBotpMiBAt2uULjAd8zw0cTvZn6GIdga-DFgdgWKvpOpU/pub?gid=48369834&single=true&output=csv';

// Indiquer que le chargement commence
$("#loading-message").show();
$("#data-cards").hide();
$("#error-message").hide();

// Récupérer les données avec D3.js
d3.csv(csvUrl).then(data => {
    // Masquer le message de chargement
    $("#loading-message").hide();
    $("#data-cards").show();

    data.forEach(function(row) {
        var contactAnswer = row["Souhaitez-vous être contacté pour participer à des projets collaboratifs en mobilité durable ?\n(Oui/Non)  "].trim();
        var coordonnees = row["Si oui, veuillez indiquer vos coordonnées :"].trim();
        
        var card = `
            <div class="card mb-3">
                <div class="card-header">
                    <h5 class="card-title"><strong>Nom de l'organisation / entité : </strong>${row["Nom de l'organisation / entité "]}</h5>
                    <p class="card-text"><strong>Rôle dans le projet de mobilité durable : </strong>${row["Quel est votre rôle dans le projet de mobilité durable ?"]}</p>
                    <button class="btn btn-primary toggle-details">Lire plus</button>
                </div>
                <div class="card-body" style="display: none;">
                    <p><strong>Horodateur:</strong> ${row["Horodateur"]}</p>
                    <p><strong>Objectifs:</strong> ${row["Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?"]}</p>
                    <p><strong>Besoins:</strong> ${row["Quels sont vos besoins spécifiques pour atteindre ces objectifs ?"]}</p>
                    <p><strong>Collaboration:</strong> ${row["Travaillez-vous actuellement avec d'autres acteurs du secteur pour répondre à ces besoins ?\n(Oui/Non)\nSi oui, veuillez préciser avec qui et comment."]}</p>
                    <p><strong>Obstacles:</strong> ${row["Quels sont les principaux obstacles auxquels vous faites face dans le développement de solutions de mobilité durable ?"]}</p>
                    <p><strong>Priorités:</strong> ${row["Quelles sont vos priorités pour surmonter ces obstacles ?"]}</p>
                    <p><strong>Solutions Innovantes:</strong> ${row["Avez-vous mis en œuvre des solutions innovantes dans le domaine de la mobilité durable ?\n(Oui/Non)\nSi oui, veuillez détailler les solutions mises en place."]}</p>
                    <p><strong>Innovations Futures:</strong> ${row["Quels types d'innovation technologique ou de collaboration souhaiteriez-vous développer à l'avenir ?"]}</p>
                    <p><strong>Contact:</strong> ${contactAnswer}</p>
                    ${
                        contactAnswer === "oui" && coordonnees 
                        ? `<p><strong>Coordonnées:</strong> ${coordonnees}</p>` 
                        : ""
                    }
                    <p><strong>Nom et Prénom :</strong> ${row["prenom"]} ${row["Nom"]}</p>
                    <p><strong>Téléphone :</strong> ${row["Téléphone"]}</p>
                    <button class="btn btn-secondary toggle-details">Lire moins</button>
                </div>
            </div>
        `;
        $("#data-cards").append(card);
    });

    // Gestion de l'affichage des détails des cartes
    $(".toggle-details").click(function() {
        var cardBody = $(this).closest(".card").find(".card-body");
        cardBody.slideToggle();
        $(this).text($(this).text() === "Lire plus" ? "Lire moins" : "Lire plus");
    });
}).catch(error => {
    // Afficher un message d'erreur en cas de problème
    $("#loading-message").hide();
    $("#error-message").show();
});

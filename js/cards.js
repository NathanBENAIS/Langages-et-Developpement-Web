function displayCards(data) {
    $("#data-cards").empty();

    data.forEach(function(row) {
        var contactAnswer = row["Souhaitez-vous être contacté pour participer à des projets collaboratifs en mobilité durable ?\n(Oui/Non)  "].trim();
        var coordonnees = row["Si oui, veuillez indiquer vos coordonnées :"].trim();
        
        var card = `
            <div class="card mb-3" data-role="${row["Quel est votre rôle dans le projet de mobilité durable ?"]}" data-objective="${row["Quels sont les principaux objectifs que vous visez en matière de mobilité durable ?"]}" data-city="${row["Adresse\n"].split(',')[1]?.trim() || ''}">
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
                    ${contactAnswer.toLowerCase() === "oui" && coordonnees 
                    ? `<p><strong>Coordonnées:</strong> ${coordonnees}</p>` 
                    : ""}
                    <p><strong>Nom et Prénom :</strong> ${row["Prénom"]} ${row["Nom"]}</p>
                    <p><strong>Email :</strong> ${row["Email"]}</p>
                    <p><strong>Adresse :</strong> ${row["Adresse\n"]}</p>
                    <button class="btn btn-secondary toggle-details">Lire moins</button>
                </div>
            </div>`;
        $("#data-cards").append(card);
    });

    $(".toggle-details").click(function() {
        var cardBody = $(this).closest(".card").find(".card-body");
        cardBody.slideToggle();
        $(this).text($(this).text() === "Lire plus" ? "Lire moins" : "Lire plus");
    });
}
sequenceDiagram
    actor User as Utilisateur
    participant UI as Interface Utilisateur
    participant API as API MobilitéDurable
    participant HERE as API HERE Maps
    participant DB as Base de données
    
    %% Calcul d'itinéraire
    User->>UI: Saisit points de départ/arrivée
    UI->>API: Envoie requête de calcul
    API->>HERE: Requête géocodage (départ)
    HERE-->>API: Retourne coordonnées départ
    API->>HERE: Requête géocodage (arrivée)
    HERE-->>API: Retourne coordonnées arrivée
    
    %% Calcul des différents modes
    par Calcul parallèle des itinéraires
        API->>HERE: Requête itinéraire voiture
        HERE-->>API: Retourne données voiture
    and
        API->>HERE: Requête itinéraire transport
        HERE-->>API: Retourne données transport
    and
        API->>HERE: Requête itinéraire vélo
        HERE-->>API: Retourne données vélo
    and
        API->>HERE: Requête itinéraire piéton
        HERE-->>API: Retourne données piéton
    end
    
    %% Calcul des émissions
    API->>API: Calcul des émissions CO2
    API->>DB: Sauvegarde du trajet
    DB-->>API: Confirmation sauvegarde
    
    %% Affichage des résultats
    API-->>UI: Retourne résultats complets
    UI->>UI: Mise à jour du dashboard
    UI-->>User: Affiche comparaison
    
    %% Interaction avec les résultats
    opt Consultation du détail
        User->>UI: Sélectionne un mode
        UI->>UI: Affiche détails du trajet
    end
    
    opt Sauvegarde en favori
        User->>UI: Sauvegarde le trajet
        UI->>API: Requête sauvegarde
        API->>DB: Enregistre en favori
        DB-->>API: Confirme sauvegarde
        API-->>UI: Confirme l'opération
        UI-->>User: Affiche confirmation
    end
    
    opt Consultation historique
        User->>UI: Demande historique
        UI->>API: Requête historique
        API->>DB: Récupère historique
        DB-->>API: Retourne données
        API-->>UI: Envoie historique
        UI-->>User: Affiche historique
    end
    
    opt Comparaison statistiques
        User->>UI: Demande statistiques
        UI->>API: Requête statistiques
        API->>DB: Récupère données
        DB-->>API: Retourne statistiques
        API-->>UI: Envoie données analysées
        UI->>UI: Génère graphiques
        UI-->>User: Affiche dashboard
    end
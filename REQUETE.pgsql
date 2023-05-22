/* une requête qui porte sur au moins trois tables ; */
    -- Liste des utilisateurs ayant posté un avis sur un concert en particulier
    SELECT * FROM Users NATURAL JOIN Avis_Concert NATURAL JOIN Concert WHERE cause = 'Charity event for childrens hospital';

    -- les concerts archivés avec une note >= 4 
    SELECT * FROM Concert NATURAL JOIN Avis_Concert WHERE archive = TRUE AND note >= 4;

    -- Nom des artistes ayant un morcequ qui existe dans au moins 7 playlists diffrentes
    SELECT DISTINCT Artiste.nom FROM Artiste a
     JOIN Morceaux m ON a.aid = m.artiste 
     JOIN Playlist_Morceaux pm ON m.mid = pm.mid GROUP BY a.nom 
     HAVING COUNT(DISTINCT pm.pid) >= 7 ;

/* une ’auto jointure’ ou ’jointure réflexive’ (jointure de deux copies d’une même table) */
    -- Les particuliers et les groupes ayant le même tag
    SELECT pseudo FROM Users p JOIN Users g ON p.tag = g.tag WHERE p.type = 'Particulier' AND g.type = 'Groupe';

/* une sous-requête corrélée ; */
    -- Les evenements ayant une moyenne des notes des avis supérieur à la moyenne des notes des avis de tous les evenements
    SELECT * FROM Concert c WHERE
        (SELECT AVG (note) FROM Avis_Concert WHERE concert = c.cid) >
        (SELECT AVG (note) FROM Avis_Concert);

    -- les Morceaux avec une durée superieure à la moyenne des durées de tous les morceaux du reseau
    SELECT * FROM Morceaux WHERE duree > (SELECT AVG(duree) FROM Morceaux);

/* une sous-requête dans le FROM ; */
    -- Le nombre d'utilisateurs ayant comme tag "Metal" (ou autre) dans leur profil
    SELECT COUNT(*) FROM (SELECT * FROM Users NATURAL JOIN Tags WHERE tag = 'Metal') AS users_metal;

    WITH users_metal AS (
        SELECT * FROM Users NATURAL JOIN Tags WHERE tag = 'Metal'
    )
    SELECT COUNT(*) FROM users_metal;

/* une sous-requête dans le WHERE ; */
    --  Tous les utilisateurs ayant posté un avis sur un concert mais auquel ils n'ont pas participé )
    SELECT utilisateur FROM Avis_Concert 
    WHERE utilisateur NOT IN (
        SELECT utilisateur 
        FROM Participer 
        WHERE concert = Avis_Concert.concert
    );

    --  le nombre/noms des groupes/asso qui ont organisé un concert avec un lineup < 3
    SELECT * FROM Users WHERE type_user = 'groupes' OR type_user = 'association' AND EXISTS
        (SELECT * FROM Concert WHERE organisateurs = uid AND lineup < 3);
    
/* deux agrégats nécessitant GROUP BY et HAVING ; */
    -- Artistes ayant une moyenne de notes des avis supérieur à 2.5
    SELECT nom, AVG(note) AS moy_note FROM Artistes NATURAL JOIN Avis_Artistes GROUP BY Nom HAVING moy_note > 2.5;

    -- Les genres avec les nombre de sous genres associés
    SELECT genre1 AS genre, COUNT(*) AS nb_sous_genre FROM Sous_genre GROUP BY genre;

/* une requête impliquant le calcul de deux agrégats (par exemple, les moyennes d’un ensemble de maximums) ; */
    SELECT  MAX(duree) AS duree_max, AVG(duree) AS duree_moyenne FROM Morceaux;

/* une jointure externe (LEFT JOIN, RIGHT JOIN ou FULL JOIN) ; */
    -- Liste des utilisateurs ayant posté un avis
    SELECT * FROM Users LEFT JOIN Avis ON Users.uid = Avis.utilisateur;

    -- Liste des organisateurs ayant organisé un événement
    SELECT * FROM Users RIGHT JOIN Concert ON Users.uid = Concert.organisateurs;
        
/* deux requêtes équivalentes exprimant une condition de totalité, l’une avec des sous requêtes corrélées et l’autre avec de l’agrégation ; */
    -- les pseudos des particuliers ayant organiser un concert
    /* Corrélée */
    SELECT pseudo FROM Users WHERE type_user = 'particulier' AND uid IN (SELECT organisateurs FROM Concert);
    
    /* Agrégation */
    SELECT pseudo FROM Users NATURAL JOIN Concert WHERE type_user = 'particulier' GROUP BY pseudo;

/* deux requêtes qui renverraient le même résultat si vos tables ne contenaient pas de nulls, mais qui renvoient des résultats différents 
ici (vos données devront donc contenir quelques nulls), vous proposerez également de petites modifications de vos requêtes 
(dans l’esprit de ce qui sera présenté dans le cours sur l’information incomplète) afin qu’elles retournent le même résultat ; */
    -- meme resultat si pas de nulls
    SELECT * FROM TourneeDates where tournee >=1 OR tournee IS NULL
    SELECT * from TourneeDates where tournee IS NOT NULL 
    --si "tournee" peut etre NULL alors la 1ere requete renvoie les NULL et les NON NULL alors que la 2eme ne renvoie que les NON NULL
    
/* une requête récursive (par exemple, une requête permettant de calculer quel est le prochain jour off d’un groupe actuellement 
en tournée) ;
Exemple : Napalm Death est actuellement en tournée (Campagne for Musical Destruction 2023), ils jouent sans interruption du 28/02 au 05/03, 
mais ils ont un jour off le 06/03 entre Utrecht (05/03) et Bristol (07/03). En supposant qu’on est aujourd’hui le 28/02, je souhaite 
connaître leur prochain jour off, qui est donc le 06/03. */


    -- Le prochain jour off d'un groupe actuellement en tournée
   /* WITH RECURSIVE next_off_day AS (
        SELECT MIN(date) AS off_day
        FROM TourneeDate NATURAL JOIN Tournee NATURAL JOIN artistes
        WHERE nom = 'Napalm Death' 
            AND concert IS NULL 
            AND date > CURRENT_DATE
        UNION ALL
        SELECT MIN(date) AS off_day
        FROM TourneeDate NATURAL JOIN Tournee NATURAL JOIN artistes
        WHERE nom = 'Napalm Death' 
            AND concert IS NULL 
            AND date > (SELECT MAX(off_day) FROM next_off_day)
    )
    SELECT off_day FROM next_off_day LIMIT 1;*/

    --toute les dates de concerts d'une tournee d'un meme artiste 
    WITH RECURSIVE ToutesLesDates AS ( 
        SELECt tid,tournee,concert,date 
        FROM TourneeDates 
        WHERE tournee = ( 
            SELECT tid FROM Tournee WHERE artiste = 'Madonna'
        )
        UNION ALL
        SELECT TourneeDates.tid,TourneeDates.tournee,TourneeDates.concert,TourneeDates.date
        FROM TourneeDates 
        Join ToutesLesDates ON TourneeDates.tournee = ToutesLesDates.tournee
        WHERE TourneeDates.date > ToutesLesDates.date

    )
    SELECT date FROM ToutesLesdates ORDER BY date;

/* une requête utilisant du fenêtrage (par exemple, pour chaque mois de 2022, les dix groupes dont les concerts ont eu le plus de succès 
ce mois-ci, en termes de nombre d’utilisateurs ayant indiqué souhaiter y participer). */
    -- Pour chaque mois de 2022, les dix concerts ont eu le plus de succès ce mois-ci, en termes de nombre d’utilisateurs
    /*Nombre de particpant par concert*/
    WITH nb_participants_concert AS (
        SELECT concert, COUNT(*) AS nb_participants
        FROM Participer 
        WHERE type_participation = 'participe'
        GROUP BY concert
    );

    /* Pour chaque mois, les dix concerts avec le plus de succés*/
    SELECT mois, concert, nb_participants
    FROM (
        SELECT EXTRACT(MONTH FROM date) AS mois, concert, nb_participants, 
            ROW_NUMBER() OVER (PARTITION BY mois ORDER BY nb_participants DESC) AS classement
        FROM nb_participants_concert NATURAL JOIN Concert
        WHERE EXTRACT(YEAR FROM date) = 2022
    ) AS classement_mois
    WHERE classement <= 10;
    
    -- 
    -- les dix concerts (playlists/Artistes/Morceaux) avec le plus grand nombre d'avis positifs (negatifs)
    WITH avis_concert_counts AS (
        SELECT concert, COUNT(*) AS nb_avis_positifs
        FROM Avis_Concert
        WHERE note > 2.5
        GROUP BY concert
    ),
    top_concerts AS (
        SELECT cid, ROW_NUMBER() OVER (ORDER BY nb_avis_positifs DESC) AS position
        FROM Concert
        JOIN avis_concert_counts ON Concert.cid = avis_concert_counts.concert
    )
    SELECT cid, position
    FROM top_concerts
    WHERE position <= 10;

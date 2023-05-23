/* une requête qui porte sur au moins trois tables ; */
    -- Liste des utilisateurs ayant posté un avis sur un concert en particulier
    SELECT pseudo FROM Users 
        JOIN Avis_Concert ON Users.uid = Avis_concert.concert 
        JOIN Concert ON Avis_Concert.concert = Concert.cid 
    WHERE cause = 'Charity event for childrens hospital';

    -- les utilisateurs ayant posté un avis et assisté à un concert
    SELECT DISTINCT pseudo FROM Users 
        JOIN Participer ON Users.uid = Participer.utilisateur
        JOIN AVIS_Concert ON Participer.concert = Avis_Concert.concert ;
   

    -- Nom des artistes ayant un morcequ qui existe dans au moins 7 playlists diffrentes
    SELECT DISTINCT a.nom FROM Artistes a
     JOIN Morceaux m ON a.aid = m.artiste 
     JOIN Playlist_Morceaux pm ON m.mid = pm.mid GROUP BY a.nom 
     HAVING COUNT(DISTINCT pm.pid) >= 7 ;

/* une ’auto jointure’ ou ’jointure réflexive’ (jointure de deux copies d’une même table) */
    -- Les particuliers et les groupes ayant le même tag
    SELECT p.pseudo FROM Users p 
    JOIN Users g ON p.tag = g.tag 
    WHERE p.type_user = 'particulier' 
    AND g.type_user = 'groupe';

/* une sous-requête corrélée ; */
    -- Les evenements ayant une moyenne des notes des avis supérieur à la moyenne des notes des avis de tous les evenements
    SELECT c.cause, 
       ROUND((SELECT AVG(note) FROM Avis_Concert WHERE concert = c.cid), 2) AS moyenne_concert
    FROM Concert c
    WHERE (SELECT AVG(note) FROM Avis_Concert WHERE concert = c.cid) > 
          (SELECT AVG(note) FROM Avis_Concert);

    -- les Morceaux avec une durée superieure à la moyenne des durées de tous les morceaux du reseau
    SELECT nom, duree/60 AS minutes, MOD(duree, 60) AS secondes FROM Morceaux 
    WHERE duree > (SELECT AVG(duree) FROM Morceaux);

/* une sous-requête dans le FROM ; */
    -- Le nombre d'utilisateurs ayant comme tag "French Pop" (ou autre) dans leur profil
    /* 
    SELECT COUNT(*) AS nb_user_french_pop 
    FROM (SELECT * FROM Users 
	    NATURAL JOIN Tags
	    WHERE nom_tag = 'musiclover') 
    AS users_french_pop;
    */
    SELECT COUNT(*) AS nb_user_musiclover
    FROM (SELECT * FROM Users 
	    JOIN Tags ON Users.tag = Tags.tid
	    WHERE nom_tag = 'musiclover') 
    AS users_french_pop;

    WITH users_musiclover AS (
        SELECT * FROM Users 
	    JOIN Tags ON Users.tag = Tags.tid
	    WHERE nom_tag = 'musiclover'
    )
    SELECT COUNT(*) AS nb_user_musiclover FROM users_musiclover;

/* une sous-requête dans le WHERE ; */
    --  Tous les utilisateurs ayant posté un avis sur un concert mais auquel ils n'ont pas participé )
    SELECT DISTINCT pseudo FROM Users u
    JOIN Avis_Concert a ON u.uid = a.utilisateur
    WHERE a.utilisateur NOT IN (
        SELECT utilisateur 
        FROM Participer 
        WHERE concert = a.concert
    );

    --  le noms des groupes/asso qui ont organisé un concert avec un lineup < 3
    SELECT pseudo FROM Users WHERE type_user = 'groupe' OR type_user = 'association' AND EXISTS
        (SELECT * FROM Concert WHERE organisateurs = uid AND lineup < 3);
    
/* deux agrégats nécessitant GROUP BY et HAVING ; */
    -- Artistes ayant une moyenne de notes des avis supérieur à 2.5
    SELECT nom, ROUND(AVG(note)) AS moy_note 
    FROM Artistes NATURAL JOIN Avis_Artistes 
    GROUP BY Nom 
    HAVING AVG(note) > 2.5;

    -- Les genres avec les nombre de sous genres associés
    SELECT g.genre AS genre, COUNT(*) AS nb_sous_genre 
    FROM Sous_genre sg
    JOIN Genre g ON sg.genre1 = g.gid
    GROUP BY sg.genre1, g.genre;

/* une requête impliquant le calcul de deux agrégats (par exemple, les moyennes d’un ensemble de maximums) ; */
    -- La duree maximal et moyenne de l'ensemble des morceaux
    SELECT MAX(duree) AS duree_max, AVG(duree) AS duree_moyenne 
    FROM Morceaux;

/* une jointure externe (LEFT JOIN, RIGHT JOIN ou FULL JOIN) ; */
    -- Liste des utilisateurs ayant posté un avis
    SELECT DISTINCT u.*
    FROM Users u
    LEFT JOIN Avis a ON u.uid = a.utilisateur
    WHERE a.aid IS NOT NULL;
    
    -- Liste des organisateurs ayant organisé un événement
    SELECT DISTINCT * FROM Users RIGHT JOIN Concert ON Users.uid = Concert.organisateurs;
        
/* deux requêtes équivalentes exprimant une condition de totalité, l’une avec des sous requêtes corrélées et l’autre avec de l’agrégation ; */
    -- les pseudos des particuliers ayant organiser un concert
    /* Corrélée */
    SELECT pseudo FROM Users WHERE type_user = 'association' AND uid IN (SELECT organisateurs FROM Concert);
    
    /* Agrégation */
    SELECT pseudo FROM Users NATURAL JOIN Concert WHERE type_user = 'association' GROUP BY pseudo;

/* deux requêtes qui renverraient le même résultat si vos tables ne contenaient pas de nulls, mais qui renvoient des résultats différents 
ici (vos données devront donc contenir quelques nulls), vous proposerez également de petites modifications de vos requêtes 
(dans l’esprit de ce qui sera présenté dans le cours sur l’information incomplète) afin qu’elles retournent le même résultat ; */
    -- meme resultat si pas de nulls
    SELECT * FROM TourneeDates where tournee >=1 OR concert IS NULL;
    SELECT * from TourneeDates where concert IS NOT NULL ;
    --si "tournee" peut etre NULL alors la 1ere requete renvoie les NULL et les NON NULL alors que la 2eme ne renvoie que les NON NULL
    
/* une requête récursive (par exemple, une requête permettant de calculer quel est le prochain jour off d’un groupe actuellement 
en tournée) ;
Exemple : Napalm Death est actuellement en tournée (Campagne for Musical Destruction 2023), ils jouent sans interruption du 28/02 au 05/03, 
mais ils ont un jour off le 06/03 entre Utrecht (05/03) et Bristol (07/03). En supposant qu’on est aujourd’hui le 28/02, je souhaite 
connaître leur prochain jour off, qui est donc le 06/03. */


    --toute les dates de concerts d'une tournee d'un meme artiste 
    WITH RECURSIVE ToutesLesDates AS ( 
        SELECt tid,tournee,concert,date 
        FROM TourneeDates 
        WHERE tournee = ( 
            SELECT tid FROM Tournee WHERE artiste = 9
        )
        UNION ALL
        SELECT TourneeDates.tid,TourneeDates.tournee,TourneeDates.concert,TourneeDates.date
        FROM TourneeDates 
        Join ToutesLesDates ON TourneeDates.tournee = ToutesLesDates.tournee
        WHERE TourneeDates.date > ToutesLesDates.date

    )
    SELECT DISTINCT date FROM ToutesLesdates ORDER BY date;

/* une requête utilisant du fenêtrage (par exemple, pour chaque mois de 2022, les dix groupes dont les concerts ont eu le plus de succès 
ce mois-ci, en termes de nombre d’utilisateurs ayant indiqué souhaiter y participer). */
    -- Pour chaque mois de 2022, les dix concerts ont eu le plus de succès ce mois-ci, en termes de nombre d’utilisateurs
    /*Nombre de particpant par concert*/
    WITH nb_participants_concert AS (
        SELECT concert, COUNT(*) AS nb_participants
        FROM Participer 
        WHERE type_participation = 'participe'
        GROUP BY concert
    )

    /* Pour chaque mois, les dix concerts avec le plus de succés*/
    SELECT mois, concert, nb_participants
    FROM (
        SELECT EXTRACT(MONTH FROM date) AS mois, concert, nb_participants, 
        ROW_NUMBER() OVER (PARTITION BY EXTRACT(MONTH FROM date) ORDER BY nb_participants DESC) AS classement
        FROM nb_participants_concert
	    JOIN Concert ON nb_participants_concert.concert = Concert.cid
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
    SELECT cause, position
    FROM top_concerts
	NATURAL JOIN Concert
    WHERE position <= 10;

--- CREATION DES TABLES ---
CREATE TYPE type_participation AS ENUM ('participe', 'interesse');
CREATE TYPE type_user as ENUM('particulier', 'association', 'artiste','groupes');
CREATE TYPE type_relation AS ENUM ('follow', 'friend');

CREATE TABLE Tags
(
    Tid INTEGER PRIMARY KEY,
    Tag varchar(50) NOT NULL
);

CREATE TABLE Avis_Concert(
    Aid SERIAL PRIMARY KEY,
    Note INTEGER CHECK(Note >= 0 AND Note <= 5) NOT NULL,
    Commentaire varchar(50) NOT NULL
);
CREATE TABLE Avis_Playlist(
    Aid SERIAL PRIMARY KEY,
    Note INTEGER CHECK(Note >= 0 AND Note <= 5) NOT NULL,
    Commentaire varchar(50) NOT NULL
);
CREATE TABLE Avis_Morceaux(
    Aid SERIAL PRIMARY KEY,
    Note INTEGER CHECK(Note >= 0 AND Note <= 5) NOT NULL,
    Commentaire varchar(50) NOT NULL    
);
CREATE TABLE Avis_Groupes(
    Aid SERIAL PRIMARY KEY,
    Note INTEGER CHECK(Note >= 0 AND Note <= 5) NOT NULL,
    Commentaire varchar(50) NOT NULL
);
CREATE TABLE Avis_Artistes(
    Aid SERIAL PRIMARY KEY,
    Note INTEGER CHECK(Note >= 0 AND Note <= 5) NOT NULL,
    Commentaire varchar(50) NOT NULL
);

CREATE TABLE Users(
    Uid SERIAL PRIMARY KEY,
    type_user type_user NOT NULL,
    Pseudo VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    mdp VARCHAR(50) NOT NULL,
    tag INTEGER,
    CONSTRAINT chk_mdp CHECK (Pseudo <> mdp),
    FOREIGN KEY (tag) REFERENCES Tags(Tid)
);

CREATE TABLE Relation 
(
    rid SERIAL PRIMARY KEY,
    relation type_relation NOT NULL,
    user1 INTEGER NOT NULL,
    user2 INTEGER NOT NULL,
    CONSTRAINT check_relation CHECK (user1 != user2),
    FOREIGN KEY (user1) REFERENCES Users(uid),
    FOREIGN KEY (user2) REFERENCES Users(uid)
);

CREATE TABLE Genre 
(
    gid SERIAL PRIMARY KEY,
    genre varchar(50) NOT NULL
);

CREATE TABLE Sous_genre 
(
    sid SERIAL PRIMARY KEY,
    genre1 INTEGER NOT NULL,
    genre2 INTEGER NOT NULL,
    CONSTRAINT check_sous_genre CHECK (genre1 != genre2),
    FOREIGN KEY (genre1) REFERENCES Genre(gid),
    FOREIGN KEY (genre2) REFERENCES Genre(gid)
);

CREATE TABLE Lineup
(
    Lid SERIAL PRIMARY KEY,
    concert_id INTEGER NOT NULL,
    artiste INTEGER NOT NULL
);

CREATE TABLE Concert
(
    Cid SERIAL PRIMARY KEY,
    Lieu varchar(50) NOT NULL,
    Prix INTEGER CHECK(Prix > 0) NOT NULL,
    Organisateurs INTEGER NOT NULL,
    Lineup INTEGER DEFAULT 0,
    nb_places INTEGER CHECK(nb_places >= 0) NOT NULL,
    besoin_benevoles boolean NOT NULL,
    cause varchar(50) NOT NULL,
    exterieur boolean NOT NULL,
    enfants boolean NOT NULL,
    Avis INTEGER
 );

CREATE TABLE Organise_concert
(
    Cid INTEGER PRIMARY KEY,
    Uid INTEGER NOT NULL,
    FOREIGN KEY (Cid) REFERENCES Concert(Cid),
    FOREIGN KEY (Uid) REFERENCES Users(Uid)
);

CREATE TABLE Archiver 
(
    Cid INTEGER PRIMARY KEY,
    FOREIGN KEY (Cid) REFERENCES Concert(Cid)
);

CREATE TABLE Archive
(
    Aid SERIAL PRIMARY KEY,
    Cid INTEGER NOT NULL,
    Lieu varchar(50) NOT NULL,
    Prix INTEGER CHECK(Prix > 0) NOT NULL,
    Organisateurs INTEGER NOT NULL,
    Lineup INTEGER NOT NULL,
    nb_places INTEGER CHECK(nb_places >= 0) NOT NULL,
    besoin_benevoles boolean NOT NULL,
    cause varchar(50) NOT NULL,
    exterieur boolean NOT NULL,
    enfants boolean NOT NULL,
    FOREIGN KEY (Cid) REFERENCES Concert(Cid),
    FOREIGN KEY (Lineup) REFERENCES Lineup(Lid),
    FOREIGN KEY (Organisateurs) REFERENCES Users(Uid)
);

CREATE TABLE Playlist 
(
    Pid SERIAL PRIMARY KEY,
    Uid INTEGER NOT NULL,
    Nom varchar(50) NOT NULL,
    nb_Morceaux int CHECK(nb_Morceaux >= 0) NOT NULL,
    Avis INTEGER ,
    CONSTRAINT chk_nom CHECK (Nom <> ' '),
    FOREIGN KEY (Uid) REFERENCES Users(Uid),
    FOREIGN KEY (Avis) REFERENCES Avis_Playlist(Aid)
);


CREATE TABLE Artistes
(
    Aid SERIAL PRIMARY KEY,
    Nom varchar(50) NOT NULL,
    Avis INTEGER,
    CONSTRAINT chk_nom CHECK (Nom <> ' '),
    FOREIGN KEY (Avis) REFERENCES Avis_Artistes(Aid)
);

CREATE TABLE Morceaux
(
    Mid SERIAL PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Duree INTEGER CHECK(Duree > 0) NOT NULL,
    Artiste INTEGER NOT NULL,
    Avis INTEGER,
    CONSTRAINT chk_nom CHECK (Nom <> ' '),
    CONSTRAINT chk_artiste CHECK (Artiste <> ' '),
    CONSTRAINT chk_album CHECK (Album <> ' '),
    FOREIGN KEY (Artiste) REFERENCES Artistes(Aid),
    FOREIGN KEY (Avis) REFERENCES Avis_Morceaux(Aid)
);

CREATE TABLE Playlist_Morceaux
(
    Pid INTEGER PRIMARY KEY,
    Mid INTEGER NOT NULL,
    FOREIGN KEY (Pid) REFERENCES Playlist(Pid),
    FOREIGN KEY (Mid) REFERENCES Morceaux(Mid)
);

CREATE TABLE Participer
(
    Pid INTEGER PRIMARY KEY,
    concert_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    type_participation type_participation NOT NULL,
    FOREIGN KEY (concert_id) REFERENCES Concert(Cid),
    FOREIGN KEY (user_id) REFERENCES Users(Uid)
);

CREATE TABLE Create_playlist 
(
    Pid INTEGER PRIMARY KEY,
    Uid INTEGER NOT NULL,
    FOREIGN KEY (Pid) REFERENCES Playlist(Pid),
    FOREIGN KEY (Uid) REFERENCES Users(Uid)
);

ALTER TABLE Lineup ADD CONSTRAINT fk_concert_id FOREIGN KEY (concert_id) REFERENCES Concert(Cid);
ALTER TABLE Lineup ADD CONSTRAINT fk_artiste FOREIGN KEY (artiste) REFERENCES Artistes(artiste);

ALTER TABLE Concert ADD CONSTRAINT fk_lineup FOREIGN KEY (Lineup) REFERENCES Lineup(Lid);
ALTER TABLE Concert ADD CONSTRAINT fk_organisateurs FOREIGN KEY (Organisateurs) REFERENCES Users(Uid);
ALTER TABLE Concert ADD CONSTRAINT fk_avis FOREIGN KEY (Avis) REFERENCES Avis_Concert(Aid);

--- REMPLISSAGE DES TABLES
insert into Users (type_user, pseudo, email, mdp) values 
('particulier', 'Alexandre', 'alexandre.diamant@etu-u.paris.fr', '9ofQCSLgOlQ'),
('particulier', 'Yahya', 'yahya.hamdi@etu-u.paris.fr', '2LPEMYZv'),
('groupes', 'AC/DC', 'imaso2@homestead.com', 'Q7faQqWM'),
('particulier', 'Dave', 'dnoriega3@upenn.edu', 'Ekh80s3X5'),
('association', 'Cleon', 'ccolum4@guardian.co.uk', 'wg7wZQg1'), 
('particulier', 'Hillary', 'hlawleff5@mit.edu', 'zY80Kydrv'), 
('groupes', 'Queen', 'bcuttles6@g.co', 'j2Nb5fr0M'), 
('particulier', 'Nadia', 'nborleace7@cmu.edu', '1LdRA9QG'), 
('artiste', 'David Bowie', 'dweinham8@slashdot.org', 'rPhmBJtPvi4'), 
('association', 'Sonnie', 'skersaw9@msu.edu', 'DxUju8RQC'),
('particulier', 'Alene', 'aizaaca@drupal.org', '38Maz1'),
('association', 'Lil', 'llydiateb@psu.edu', 'PLAh8ztfF1p'),
('artiste', 'Eminem', 'alockhartc@technorati.com', 'KdViQ7FW1iK'),
('particulier', 'Andriette', 'achiened@cyberchimps.com', 'yOLxvCLmLEkC'),
('association', 'Jilli', 'jformoye@spiegel.de', 'Bb8C4N'),
('particulier', 'Minnaminnie', 'mcarverhillf@angelfire.com', 'vu3q6fUZv'),
('groupes', 'The Beatles', 'sfriettg@unicef.org', 'YEfuJYY'),
('particulier', 'Zorana', 'zthickh@symantec.com', 'dQeOSd2G'),
('particulier', 'Kally', 'kjacquemineti@google.pl', 'dnDVNrih3ta'),
('association', 'Roxanne', 'rmerseyj@sourceforge.net', '3S2ZSgeHyPis'),
('particulier', 'Johnna', 'jmcneilk@ameblo.jp', 'Kwu8h2tOK'),
('particulier', 'Cthrine', 'cshinefieldl@merriam-webster.com', '57NntLX'),
('association', 'Valera', 'vtennym@mozilla.org', 'LRsYpV3sf'),
('particulier', 'Reidar', 'rfullunn@google.com.br', '4trZgFqduS'),
('particulier', 'Gilburt', 'gdriverso@independent.co.uk', '39IR6bdAtO'),
('association', 'Live Nation', 'gsenter1@freewebs.com', 'eSYBJX3t87'),
('association', 'Le Transbordeur', 'bwickwar2@twitter.com', 'C6oowhEJ'),
('association', 'Olympique de Marseille', 'ngrichukhin3@quantcast.com', 'YjphukW'),
('association', 'Festival Les Siestes Electroniques', 'fillingworth4@economist.com', 'MF9xhTvieB7k'),
('association', 'La Nuit de l''Erdre', 'bgoaks6@fotki.com', 'IMqC6HscFf'),
('association', 'Hellfest Productions', 'bpatters7@intel.com', 'u7AZ1k3'),
('association', 'European Youth Orchestra', 'srudolph8@gov.uk', 'aiXHYtMJ2vXB'),
('association', 'Les Estivales de Montpellier', 'flaughtisse9@cdc.gov', 'OVO0KewwWLCy'),
('association', 'Rock School Barbey', 'cprotheroa@umn.edu', 'YgVSg3G2'),
('association', 'Aéronef', 'lgumaryb@smh.com.au', 'BbP606'),
('association', 'Festival Mythos', 'fdannehlc@indiegogo.com', 'QpxGeCUlfbf'),
('association', 'Les Flâneries Musicales de Reims', 'mtregenzad@mozilla.org', 'WEtEdXcfZ0Hr'),
('association', 'Fête de la Musique', 'rshepearde@eventbrite.com', 'SliyHBcd'),
('association', 'Festival Paroles et Musiques', 'btapton0@cbslocal.com', 'HgV0lbY'),
('association', 'Le Summum', 'aianilli1@wikimedia.org', '56yCsUheqg1I');


insert into Relation (relation, user1, user2) values
('friend', 1, 2),
('friend', 2, 1),
('follow', 1, 4),
('follow', 23, 5),
('friend', 8, 17),
('friend', 17, 8),
('follow', 1, 6),
('follow', 3, 9),
('follow', 3, 6),
('follow', 3, 7);

insert into Genre (genre) values 
('Alternative'),
('Punk'),
('Blues'),
('Blues Rock'),
('Classical'),
('Orchestral'),
('Country'),
('Christian Country'),
('Dance'),
('Dupstep'),
('Electronic'),
('8bit'),
('Hip-Hop/Rap'),
('East Coast'),
('Jazz'),
('Pop'),
('Europop'),
('French pop');

insert into Sous_genre (genre1, genre2) values 
(1, 2),
(3, 4),
(5, 6),
(7, 8),
(9, 10),
(11, 12),
(13, 14),
(16, 17),
(17, 18);

insert into Concert (Lieu, Prix, Organisateurs, nb_places, besoin_benevoles, cause, exterieur, enfants) values 
('Paris', 25.0, 26, 5000, true, 'Charity event for childrens hospital', false, true),
('Lyon', 20.0, 27, 2000, false, 'Music festival', true, false),
('Marseille', 15.0, 28, 10000, true, 'Fundraiser for local sports club', true, false),
('Toulouse', 12.5, 29, 3000, true, 'Electronic music festival', true, false),
('Nice', 30.0, 30, 5000, false, 'Outdoor music festival', true, true),
('Nantes', 22.0, 31, 15000, true, 'Heavy metal music festival', false, false),
('Strasbourg', 18.0, 32, 2500, false, 'Classical music concert', false, true),
('Montpellier', 10.0, 33, 500, true, 'Summer music festival', true, true),
('Bordeaux', 27.5, 34, 3000, true, 'Rock music festival', false, false),
('Lille', 17.5, 35, 2500, true, 'Indie rock music festival', true, false),
('Rennes', 13.0, 36, 2000, true, 'Multidisciplinary arts festival', false, true),
('Reims', 20.0, 37, 1000, false, 'Classical music festival', false, false),
('Le Havre', 8.0, 38, 500, false, 'Summer music festival', true, true),
('Saint-Etienne', 25.0, 39, 4000, true, 'Music and spoken word festival', true, false),
('Grenoble', 14.5, 40, 3000, true, 'Pop and electronic music festival', false, false);

insert into Lineup (concert_id, artiste) values 
(1, 1),(1, 2),(1, 3),(2, 4),(2, 5),(2, 6),(3, 7),(3, 8),(3, 9),(4, 10),(4, 11),(4, 12),(5, 13),(5, 14),
(5, 15),(6, 16),(6, 17),(6, 18),(7, 19),(7, 20),(7, 21),(8, 22),(8, 23),(8, 24),(9, 25),(9, 26),(9, 27),
(10, 28),(10, 29),(10, 30),(11, 31),(11, 32),(11, 33),(12, 34),(12, 35),(12, 36),(13, 37),(13, 38),
(13, 39),(14, 40),(14, 41),(14, 42),(15, 43),(15, 44),(15, 45);

UPDATE Concert SET Lineup = (SELECT id FROM Lineup WHERE Concert.id = Lineup.concert_id);

insert into Tags (Tag) values
('musiclover'),
('concerts'),
('livemusic'),
('musicianlife'),
('vinylcollection'),
('musicproducer'),
('rockmusic'),
('classicalmusic'),
('jazzmusic'),
('musictherapy'),
('musicfestival'),
('musicvideo'),
('indiemusic'),
('rapmusic'),
('musictheory');

insert into Tags (Tag) SELECT genre FROM Genre;

insert into Participer (concert_id, user_id, type_participation) values
(1, 3, 'participe'),
(2, 7, 'participe'),
(7, 18, 'interesse'),
(4, 10, 'participe'),
(6, 1, 'interesse'),
(8, 12, 'interesse'),
(3, 9, 'participe'),
(12, 4, 'participe'),
(13, 16, 'participe'),
(11, 8, 'interesse'),
(1, 5, 'participe'),
(2, 19, 'interesse'),
(9, 6, 'interesse'),
(15, 14, 'participe'),
(8, 11, 'participe'),
(14, 17, 'interesse'),
(5, 2, 'participe'),
(10, 13, 'participe'),
(7, 20, 'participe'),
(4, 15, 'interesse'),
(3, 20, 'participe'),
(9, 16, 'interesse'),
(12, 7, 'interesse'),
(13, 1, 'participe'),
(6, 11, 'participe'),
(11, 19, 'interesse'),
(1, 13, 'participe'),
(2, 4, 'interesse'),
(14, 10, 'participe');

--Artistes
INSERT INTO Artistes (Nom) VALUES
('Queen'),('The Beatles'),
('Michael Jackson'),
('AC/DC'),
('Elvis Presley'),
('Pink Floyd'),
('Led Zeppelin'),
('U2'),
('Madonna'),
('Nirvana'),
('Bob Marley'),
('Metallica'),
('David Bowie'),
('The Rolling Stones'),
('Guns N'' Roses'),
('The Who'),
('Prince'),
('Bruce Springsteen'),
('Eminem'),
('Beyoncé'),
('Radiohead'),
('Stevie Wonder'),
('Jimi Hendrix'),
('The Doors'),
('Red Hot Chili Peppers'),
('Eric Clapton'),
('Janis Joplin'),
('Bob Dylan'),
('Queen'),
('Frank Sinatra'),
('Miles Davis'),
('John Lennon'),
('Ray Charles'),
('Johnny Cash'),
('Sting'),
('Elton John');

---Morceaux ---

INSERT INTO Morceaux (Nom, Duree, Artiste) VALUES
('Bohemian Rhapsody', 354, 1),
('Imagine', 182, 2),
('Billie Jean', 295, 3),
('Back in Black', 255, 4),
('Jailhouse Rock', 156, 5),
('Another Brick in the Wall', 362, 6),
('Stairway to Heaven', 482, 7),
('With or Without You', 299, 8),
('Like a Prayer', 334, 9),
('Smells Like Teen Spirit', 302, 10),
('No Woman, No Cry', 236, 11),
('Enter Sandman', 332, 12),
('Space Oddity', 315, 13),
('Satisfaction', 223, 14),
('Sweet Child O'' Mine', 356, 15),
('My Generation', 225, 16),
('Purple Rain', 527, 17),
('Born in the USA', 252, 18),
('Lose Yourself', 341, 19),
('Crazy in Love', 235, 20),
('Paranoid Android', 384, 21),
('Superstition', 268, 22),
('All Along the Watchtower', 244, 23),
('Riders on the Storm', 413, 24),
('Under the Bridge', 265, 25),
('Tears in Heaven', 283, 26),
('Piece of My Heart', 269, 27),
('Like a Rolling Stone', 366, 28),
('Bohemian Rhapsody', 354, 1),
('Fly Me to the Moon', 179, 29),
('So What', 320, 30),
('Imagine', 182, 2),
('Folsom Prison Blues', 170, 31),
('Englishman in New York', 293, 32),
('Rocket Man', 296, 33),
('A Change Is Gonna Come', 196, 34);

---Playlist---
INSERT INTO Playlist (Uid, Nom, nb_Morceaux) VALUES
(1, 'Playlist de rock', 15),
(2, 'Mes chansons préférées', 10),
(3, 'Hits du moment', 8),
(1, 'Classiques indémodables', 20),
(4, 'Hip Hop en feu', 12),
(5, 'Jazz et Blues', 18),
(2, 'Chill et détente', 7),
(6, 'Latino caliente', 11),
(7, 'Pop internationale', 9),
(8, 'Rap US', 14),
(9, 'Country love songs', 16),
(10, 'Musique électronique', 22),
(11, 'Reggae roots', 13),
(12, 'Classique contemporain', 25),
(13, 'Funk et Soul', 17),
(14, 'Chansons françaises', 19),
(15, 'Musique orientale', 10),
(16, 'Métal extrême', 8),
(17, 'Ambiance lounge', 12),
(18, 'Musique indienne', 16),
(19, 'Blues rock', 14),
(20, 'Musique celtique', 11),
(21, 'Indie pop', 9),
(22, 'R&B moderne', 13),
(23, 'Musique africaine', 15),
(24, 'Rock alternatif', 18),
(25, 'Musique asiatique', 10),
(26, 'Pop acoustique', 7),
(27, 'Musique brésilienne', 11),
(28, 'Hard rock', 14),
(29, 'Musique traditionnelle', 16),
(30, 'Musique pour la méditation', 9),
(31, 'Chants religieux', 12),
(32, 'Rock progressif', 17),
(33, 'Musique pour le sport', 10),
(34, 'Musique pour étudier', 8);

---Playlist_Morceaux ---
INSERT INTO Playlist_Morceaux (Pid, Mid) VALUES
(1, 1), (1, 3), (1, 5), (1, 7), (1, 9),
(2, 2), (2, 4), (2, 6), (2, 8), (2, 10),
(3, 12), (3, 14), (3, 16), (3, 18), (3, 20),
(4, 11), (4, 13), (4, 15), (4, 17), (4, 19),
(5, 21), (5, 23), (5, 25), (5, 27), (5, 29),
(6, 30), (6, 31), (6, 32), (6, 33), (6, 34),
(7, 1), (7, 7), (7, 15), (7, 23), (7, 31),
(8, 2), (8, 8), (8, 16), (8, 24), (8, 32),
(9, 3), (9, 9), (9, 17), (9, 25), (9, 33),
(10, 4), (10, 10), (10, 18), (10, 26), (10, 34);


---Avis Concerts---
INSERT INTO Avis_Concert (Note, Commentaire) VALUES (3, 'Le concert était moyen'),
(4, 'Bonne ambiance mais le son était un peu faible'),
(5, 'Excellent concert, j''ai adoré !'),
(2, 'Déçu, je m''attendais à mieux'),
(3, 'Pas mal mais pas inoubliable non plus'),
(4, 'Très bonne performance des artistes'),
(1, 'Très mauvaise expérience, je ne recommande pas du tout'),
(5, 'Un des meilleurs concerts que j''ai pu voir'),
(4, 'Très bon choix de morceaux, j''ai passé un super moment'),
(3, 'Le concert était correct, sans plus');

---Avis Playlists---
INSERT INTO Avis_Playlist (Note, Commentaire) VALUES
(4, "J'aime beaucoup cette playlist"),
(3, "Certains morceaux ne sont pas à mon goût"),
(5, "La meilleure playlist jamais créée!"),
(2, "Je ne suis pas fan de cette sélection"),
(4, "Il y a quelques morceaux que j'adore dans cette playlist"),
(1, "Je n'aime aucun des morceaux de cette playlist"),
(5, "C'est exactement ce que j'attendais d'une playlist!"),
(3, "Il y a quelques morceaux que j'aime bien"),
(4, "Bonne playlist pour travailler"),
(2, "Je ne comprends pas pourquoi ces morceaux sont dans cette playlist"),
( 5, "Je pourrais écouter cette playlist en boucle toute la journée"),
(3, "Il y a des morceaux que je ne connaissais pas et que j'aime bien"),
(1, "Je ne recommanderais pas cette playlist à quiconque"),
(4, "Très bon choix de morceaux pour une soirée entre amis"),
(2, "Je n'aime pas du tout cette playlist"),
(5, "Cette playlist me met toujours de bonne humeur!"),
(3, "Il y a quelques morceaux que j'ai déjà entendus trop souvent"),
(4, "Bonne playlist pour faire du sport"),
(2, "Je trouve que certains morceaux ne vont pas ensemble"),
( 5, "J'adore tous les morceaux de cette playlist!");

--Avis_Morceaux---
INSERT INTO Avis_Morceaux (Note, Commentaire) VALUES
(4, 'Très bon morceau, je le recommande !'),
(3, 'Sympathique, mais sans plus.'),
(5, 'Le meilleur morceau de l''album, une vraie pépite !'),
(2, 'Décevant, je m''attendais à mieux.'),
(1, 'Nul, je ne comprends pas pourquoi il est sur l''album.'),
(4, 'Un morceau qui met de bonne humeur, parfait pour commencer la journée.'),
(3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(5, 'Sublime, il me donne des frissons à chaque écoute.'),
(2, 'Mauvais, j''ai vite zappé ce morceau.'),
(1, 'Affreux, je ne comprends pas comment il a pu être enregistré.'),
(4, 'Un morceau qui donne la pêche, je l''écoute en boucle.'),
(3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(5, 'Sublime, il me donne des frissons à chaque écoute.'),
(2, 'Mauvais, j''ai vite zappé ce morceau.'),
(1, 'Affreux, je ne comprends pas comment il a pu être enregistré.'),
(4, 'Un morceau qui donne la pêche, je l''écoute en boucle.'),
(3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(5, 'Sublime, il me donne des frissons à chaque écoute.'),
(2, 'Mauvais, j''ai vite zappé ce morceau.'),
(1, 'Affreux, je ne comprends pas comment il a pu être enregistré.'),
(4, 'Un morceau qui donne la pêche, je l''écoute en boucle.'),
(3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(5, 'Sublime, il me donne des frissons à chaque écoute.'),
(2, 'Mauvais, j''ai vite zappé ce morceau.'),
(1, 'Affreux, je ne comprends pas comment il a pu être enregistré.'),
(4, 'Un morceau qui donne la pêche, je l''écoute en boucle.'),
(3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(5, 'Sublime, il me donne des frissons à chaque écoute.'),
(2, 'Mauvais, j''ai vite zappé ce morceau.'),
(1, 'Affreux, je ne comprends pas comment il a pu être enregistré.'),
(4, 'Un morceau qui donne la pêche, je l''écoute en boucle.'),
(3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(5, 'Sublime, il me donne des frissons à chaque fois');

---Avis "Artistes "---
INSERT INTO Avis_Artistes (Note, Commentaire) VALUES
(4, 'J''adore cet artiste, sa musique me transporte.'),
(5, 'Cet artiste est tout simplement incroyable, il sait toucher le coeur de son public.'),
(3, 'Je trouve que cet artiste manque un peu d''originalité.'),
(2, 'Je ne suis pas fan de cet artiste, je trouve sa musique trop commerciale.'),
(1, 'Je n''aime pas du tout cet artiste, je trouve sa musique insipide.'),
(5, 'Cet artiste est une vraie révélation, j''ai été ému aux larmes lors de son dernier concert.'),
(4, 'Très bon artiste, j''ai passé une excellente soirée lors de son concert.'),
(3, 'Je ne suis pas convaincu par cet artiste, je trouve que sa musique manque d''âme.'),
(4, 'Cet artiste a un véritable talent, je suis impatient de le revoir sur scène.'),
(2, 'Je n''ai pas du tout accroché à cet artiste, je trouve sa musique fade et sans intérêt.'),
(5, 'Un artiste d''exception, j''ai été transporté par sa prestation.'),
(3, 'Je suis partagé quant à cet artiste, certaines de ses chansons sont excellentes, d''autres beaucoup moins.'),
(4, 'Cet artiste a un vrai potentiel, j''ai hâte de voir comment il va évoluer.'),
(2, 'Je n''ai pas aimé cet artiste, je trouve sa musique trop répétitive.'),
(1, 'Je déteste cet artiste, je trouve sa musique insupportable.'),
(5, 'Un artiste hors du commun, sa musique est un véritable enchantement.'),
(4, 'Un très bon artiste, j''ai passé une excellente soirée lors de son dernier concert.'),
(3, 'Je suis mitigé quant à cet artiste, il a du talent mais je trouve que sa musique manque de profondeur.'),
(2, 'Je ne suis pas du tout fan de cet artiste, je trouve sa musique banale et sans saveur.'),
(5, 'Cet artiste est tout simplement exceptionnel, j''ai été transporté par sa prestation.');

---Avis Groupes---
INSERT INTO Avis_Groupes (Note, Commentaire) VALUES
(4, 'J''ai été agréablement surpris par la qualité de leur prestation lors du dernier concert.'),
(3, 'Je trouve que leur dernier single manque d''originalité.'),
(5, 'Ce groupe est incroyable! Je suis un grand fan!'),
(2, 'Je n''ai pas du tout apprécié leur dernier album.'),
(4, 'Le concert était excellent! Ils ont vraiment mis le feu!'),
(5, 'Leur dernier clip est une oeuvre d''art!'),
(3, 'Leur prestation lors du festival était correcte, sans plus.'),
(1, 'Je suis extrêmement déçu de leur dernier album. Je ne recommande pas.'),
(2, 'Je trouve que leur musique manque de cohérence.'),
(4, 'J''ai passé un bon moment lors de leur dernier concert.');


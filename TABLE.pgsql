--- CREATION DES TABLES ---
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TYPE type_participation AS ENUM ('participe', 'interesse');
CREATE TYPE type_user as ENUM('particulier', 'association', 'artiste', 'groupes');
CREATE TYPE type_relation AS ENUM ('follow', 'friend');
CREATE TYPE type_avis AS ENUM ('concert', 'playlist', 'morceaux', 'groupes', 'artistes');

CREATE TABLE Tags
(
    tid SERIAL PRIMARY KEY,
    tag varchar(50) NOT NULL
);

CREATE TABLE Avis_Concert(
    aid SERIAL PRIMARY KEY,
    concert INTEGER NOT NULL,
    utilisateur INTEGER NOT NULL,
    note INTEGER CHECK(note >= 0 AND note <= 5) NOT NULL,
    commentaire text NOT NULL
);
CREATE TABLE Avis_Playlist(
    aid SERIAL PRIMARY KEY,
    playlist INTEGER NOT NULL,
    utilisateur INTEGER NOT NULL,
    note INTEGER CHECK(note >= 0 AND note <= 5) NOT NULL,
    commentaire text NOT NULL
);
CREATE TABLE Avis_Morceaux(
    aid SERIAL PRIMARY KEY,
    morceau INTEGER NOT NULL,
    utilisateur INTEGER NOT NULL,
    note INTEGER CHECK(note >= 0 AND note <= 5) NOT NULL,
    commentaire text NOT NULL    
);
CREATE TABLE Avis_Groupes(
    aid SERIAL PRIMARY KEY,
    groupe INTEGER NOT NULL,
    utilisateur INTEGER NOT NULL,
    note INTEGER CHECK(note >= 0 AND note <= 5) NOT NULL,
    commentaire text NOT NULL
);
CREATE TABLE Avis_Artistes(
    aid SERIAL PRIMARY KEY,
    artiste INTEGER NOT NULL,
    utilisateur INTEGER NOT NULL,
    note INTEGER CHECK(note >= 0 AND note <= 5) NOT NULL,
    commentaire text NOT NULL
);

CREATE TABLE Avis (
    aid SERIAL PRIMARY KEY,
    avis_id INTEGER NOT NULL,
    utilisateur INTEGER NOT NULL,
    type_avis type_avis NOT NULL
);

CREATE TABLE Users(
    uid SERIAL PRIMARY KEY,
    type_user type_user NOT NULL,
    pseudo VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    mdp VARCHAR(50) NOT NULL,
    date_inscription DATE NOT NULL,
    tag INTEGER,
    CONSTRAINT chk_mdp CHECK (pseudo <> mdp),
    FOREIGN KEY (tag) REFERENCES Tags(tid)
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
    lid SERIAL PRIMARY KEY,
    concert INTEGER NOT NULL,
    artiste INTEGER NOT NULL
);

CREATE TABLE Concert
(
    cid SERIAL PRIMARY KEY,
    lieu varchar(50) NOT NULL,
    prix INTEGER CHECK(Prix > 0) NOT NULL,
    organisateurs INTEGER NOT NULL,
    lineup INTEGER,
    nb_places INTEGER CHECK(nb_places >= 0) NOT NULL,
    besoin_benevoles boolean NOT NULL,
    cause varchar(50) NOT NULL,
    exterieur boolean NOT NULL,
    enfants boolean NOT NULL,
    avis INTEGER,
    date DATE NOT NULL
 );

CREATE TABLE Organise_concert
(
    cid SERIAL PRIMARY KEY,
    organisateurs INTEGER NOT NULL,
    FOREIGN KEY (cid) REFERENCES Concert(cid),
    FOREIGN KEY (organisateurs) REFERENCES Users(uid)
);

CREATE TABLE Archiver 
(
    cid INTEGER PRIMARY KEY,
    FOREIGN KEY (cid) REFERENCES Concert(cid)
);

CREATE TABLE Archive
(
    aid SERIAL PRIMARY KEY,
    cid INTEGER NOT NULL,
    lieu varchar(50) NOT NULL,
    prix INTEGER CHECK(Prix > 0) NOT NULL,
    organisateurs INTEGER NOT NULL,
    lineup INTEGER NOT NULL,
    nb_places INTEGER CHECK(nb_places >= 0) NOT NULL,
    besoin_benevoles boolean NOT NULL,
    cause varchar(50) NOT NULL,
    exterieur boolean NOT NULL,
    enfants boolean NOT NULL,
    FOREIGN KEY (cid) REFERENCES Concert(cid),
    FOREIGN KEY (lineup) REFERENCES Lineup(lid),
    FOREIGN KEY (organisateurs) REFERENCES Users(uid)
);

CREATE TABLE Playlist 
(
    pid SERIAL PRIMARY KEY,
    utilisateur INTEGER NOT NULL,
    nom varchar(50) NOT NULL,
    nb_morceaux int CHECK(nb_morceaux >= 0) NOT NULL,
    avis INTEGER,
    CONSTRAINT chk_nom CHECK (nom <> ' '),
    FOREIGN KEY (utilisateur) REFERENCES Users(uid),
    FOREIGN KEY (avis) REFERENCES Avis_Playlist(aid)
);


CREATE TABLE Artistes
(
    aid SERIAL PRIMARY KEY,
    nom varchar(50) NOT NULL,
    avis INTEGER,
    CONSTRAINT chk_nom CHECK (nom <> ' '),
    FOREIGN KEY (Avis) REFERENCES Avis_Artistes(aid)
);

CREATE TABLE Morceaux
(
    mid SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    duree INTEGER CHECK(Duree > 0) NOT NULL,
    artiste INTEGER NOT NULL,
    avis INTEGER,
    FOREIGN KEY (Artiste) REFERENCES Artistes(aid),
    FOREIGN KEY (Avis) REFERENCES Avis_Morceaux(aid)
);

CREATE TABLE Playlist_Morceaux
(
    pid INTEGER NOT NULL,
    mid INTEGER NOT NULL,
    FOREIGN KEY (pid) REFERENCES Playlist(pid),
    FOREIGN KEY (mid) REFERENCES Morceaux(mid)
);

CREATE TABLE Participer
(
    pid SERIAL PRIMARY KEY,
    concert INTEGER NOT NULL,
    utilisateur INTEGER NOT NULL,
    type_participation type_participation NOT NULL,
    FOREIGN KEY (concert) REFERENCES Concert(cid),
    FOREIGN KEY (utilisateur) REFERENCES Users(uid)
);

CREATE TABLE Create_playlist 
(
    pid SERIAL PRIMARY KEY,
    uid INTEGER NOT NULL,
    FOREIGN KEY (pid) REFERENCES Playlist(pid),
    FOREIGN KEY (uid) REFERENCES Users(uid)
);

CREATE TABLE Tournee (
    tid SERIAL PRIMARY KEY,
    artiste INT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    CONSTRAINT check_date CHECK (date_debut < date_fin),
    FOREIGN KEY (artiste) REFERENCES Artistes(aid) 
);

CREATE TABLE TourneeDates (
    tid SERIAL PRIMARY KEY,
    tournee INT NOT NULL,
    concert INT,
    date DATE NOT NULL,
    FOREIGN KEY (tournee) REFERENCES Tournee(tid),
    FOREIGN KEY (concert) REFERENCES Concert(cid)
);

ALTER TABLE Lineup ADD CONSTRAINT fk_concert_id FOREIGN KEY (concert) REFERENCES Concert(cid);
ALTER TABLE Lineup ADD CONSTRAINT fk_artiste FOREIGN KEY (artiste) REFERENCES Artistes(aid);

ALTER TABLE Concert ADD CONSTRAINT fk_organisateurs FOREIGN KEY (Organisateurs) REFERENCES Users(uid);
ALTER TABLE Concert ADD CONSTRAINT fk_avis FOREIGN KEY (Avis) REFERENCES Avis_Concert(aid);

ALTER TABLE avis_concert ADD CONSTRAINT fk_concert FOREIGN KEY (concert) REFERENCES Concert(cid);
ALTER TABLE avis_playlist ADD CONSTRAINT fk_playlist FOREIGN KEY (playlist) REFERENCES Playlist(pid);
ALTER TABLE avis_morceaux ADD CONSTRAINT fk_morceau FOREIGN KEY (morceau) REFERENCES Morceaux(mid);

--- TODO : ajouter une table pour les groupes
--ALTER TABLE avis_groupes ADD CONSTRAINT fk_groupe FOREIGN KEY (groupe) REFERENCES Groupes(gid);

ALTER TABLE avis_artistes ADD CONSTRAINT fk_artiste FOREIGN KEY (artiste) REFERENCES Artistes(aid);

ALTER TABLE avis_concert ADD CONSTRAINT fk_utilisateur_concert FOREIGN KEY (utilisateur) REFERENCES Users(uid);
ALTER TABLE avis_playlist ADD CONSTRAINT fk_utilisateur_playlist FOREIGN KEY (utilisateur) REFERENCES Users(uid);
ALTER TABLE avis_morceaux ADD CONSTRAINT fk_utilisateur_morceau FOREIGN KEY (utilisateur) REFERENCES Users(uid);
ALTER TABLE avis_groupes ADD CONSTRAINT fk_utilisateur_groupe FOREIGN KEY (utilisateur) REFERENCES Users(uid);
ALTER TABLE avis_artistes ADD CONSTRAINT fk_utilisateur_artiste FOREIGN KEY (utilisateur) REFERENCES Users(uid);

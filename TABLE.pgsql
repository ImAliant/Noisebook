--- CREATION DES TABLES ---
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TYPE type_participation AS ENUM ('participe', 'interesse');
CREATE TYPE type_user as ENUM('particulier', 'association', 'artiste','groupes');
CREATE TYPE type_relation AS ENUM ('follow', 'friend');

CREATE TABLE Tags
(
    Tid SERIAL PRIMARY KEY,
    Tag varchar(50) NOT NULL
);

CREATE TABLE Avis_Concert(
    Aid SERIAL PRIMARY KEY,
    Note INTEGER CHECK(Note >= 0 AND Note <= 5) NOT NULL,
    Commentaire text NOT NULL
);
CREATE TABLE Avis_Playlist(
    Aid SERIAL PRIMARY KEY,
    Note INTEGER CHECK(Note >= 0 AND Note <= 5) NOT NULL,
    Commentaire text NOT NULL
);
CREATE TABLE Avis_Morceaux(
    Aid SERIAL PRIMARY KEY,
    Note INTEGER CHECK(Note >= 0 AND Note <= 5) NOT NULL,
    Commentaire text NOT NULL    
);
CREATE TABLE Avis_Groupes(
    Aid SERIAL PRIMARY KEY,
    Note INTEGER CHECK(Note >= 0 AND Note <= 5) NOT NULL,
    Commentaire text NOT NULL
);
CREATE TABLE Avis_Artistes(
    Aid SERIAL PRIMARY KEY,
    Note INTEGER CHECK(Note >= 0 AND Note <= 5) NOT NULL,
    Commentaire text NOT NULL
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
    Lineup INTEGER,
    nb_places INTEGER CHECK(nb_places >= 0) NOT NULL,
    besoin_benevoles boolean NOT NULL,
    cause varchar(50) NOT NULL,
    exterieur boolean NOT NULL,
    enfants boolean NOT NULL,
    Avis INTEGER
 );

CREATE TABLE Organise_concert
(
    Cid SERIAL PRIMARY KEY,
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
    Pid SERIAL PRIMARY KEY,
    concert_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    type_participation type_participation NOT NULL,
    FOREIGN KEY (concert_id) REFERENCES Concert(Cid),
    FOREIGN KEY (user_id) REFERENCES Users(Uid)
);

CREATE TABLE Create_playlist 
(
    Pid SERIAL PRIMARY KEY,
    Uid INTEGER NOT NULL,
    FOREIGN KEY (Pid) REFERENCES Playlist(Pid),
    FOREIGN KEY (Uid) REFERENCES Users(Uid)
);

ALTER TABLE Lineup ADD CONSTRAINT fk_concert_id FOREIGN KEY (concert_id) REFERENCES Concert(Cid);
ALTER TABLE Lineup ADD CONSTRAINT fk_artiste FOREIGN KEY (artiste) REFERENCES Artistes(Aid);

ALTER TABLE Concert ADD CONSTRAINT fk_lineup FOREIGN KEY (Lineup) REFERENCES Lineup(Lid);
ALTER TABLE Concert ADD CONSTRAINT fk_organisateurs FOREIGN KEY (Organisateurs) REFERENCES Users(Uid);
ALTER TABLE Concert ADD CONSTRAINT fk_avis FOREIGN KEY (Avis) REFERENCES Avis_Concert(Aid);



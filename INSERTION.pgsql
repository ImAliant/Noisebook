--- REMPLISSAGE DES TABLES
INSERT INTO Genre (genre) VALUES 
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

INSERT INTO Sous_genre (genre1, genre2) VALUES 
(1, 2),
(3, 4),
(5, 6),
(7, 8),
(9, 10),
(11, 12),
(13, 14),
(16, 17),
(17, 18);

INSERT INTO Tags (nom_tag) VALUES
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

INSERT INTO Tags (nom_tag) SELECT genre FROM Genre;

INSERT INTO Users (type_user, pseudo, email, mdp, date_inscription, tag) values
('particulier', 'Alexandre', 'alexandre.diamant@etu-u-paris.fr', '9ofQCSLgOlQ', '2021-10-30', 1),
('particulier', 'Yahya', 'yahya.hamdi@etu-u-paris.fr', '2LPEMYZv', '2021-11-17', 4),
('groupe', 'AC/DC', 'imaso2@homestead.com', 'Q7faQqWM', '2020-04-04', 3),
('particulier', 'Dave', 'dnoriega3@upenn.edu', 'Ekh80s3X5', '2021-04-03', NULL),
('association', 'Cleon', 'ccolum4@guardian.co.uk', 'wg7wZQg1', '2022-07-12', 33), 
('particulier', 'Hillary', 'hlawleff5@mit.edu', 'zY80Kydrv', '2020-04-15', NULL), 
('association', 'Live Nation', 'gsenter1@freewebs.com', 'eSYBJX3t87', '2023-04-03', 2),
('association', 'Le Transbordeur', 'bwickwar2@twitter.com', 'C6oowhEJ', '2022-09-08', 2),
('association', 'Olympique de Marseille', 'ngrichukhin3@quantcast.com', 'YjphukW', '2020-11-15', 2),
('association', 'Festival Les Siestes Electroniques', 'fillingworth4@economist.com', 'MF9xhTvieB7k', '2022-12-15',2),
('association', 'La Nuit de l''Erdre', 'bgoaks6@fotki.com', 'IMqC6HscFf', '2022-04-05',2),
('association', 'Hellfest Productions', 'bpatters7@intel.com', 'u7AZ1k3', '2021-11-03',2),
('association', 'European Youth Orchestra', 'srudolph8@gov.uk', 'aiXHYtMJ2vXB', '2022-04-16', 2),
('association', 'Les Estivales de Montpellier', 'flaughtisse9@cdc.gov', 'OVO0KewwWLCy', '2023-02-09', 2),
('association', 'Rock School Barbey', 'cprotheroa@umn.edu', 'YgVSg3G2', '2022-02-10', 2),
('association', 'Aéronef', 'lgumaryb@smh.com.au', 'BbP606', '2020-09-16', 2),
('association', 'Festival Mythos', 'fdannehlc@indiegogo.com', 'QpxGeCUlfbf', '2022-10-25', 2),
('association', 'Les Flâneries Musicales de Reims', 'mtregenzad@mozilla.org', 'WEtEdXcfZ0Hr', '2020-01-08', 2),
('association', 'Fête de la Musique', 'rshepearde@eventbrite.com', 'SliyHBcd', '2021-04-17', 2),
('association', 'Festival Paroles et Musiques', 'btapton0@cbslocal.com', 'HgV0lbY', '2022-10-16', 2),
('association', 'Le Summum', 'aianilli1@wikimedia.org', '56yCsUheqg1I', '2021-09-12', 2),
('groupe', 'abarclay0', 'gcannan0@ycombinator.com', 'qvAQm752Fen', '2020-03-19', 4),
('artiste', 'cwestall1', 'tmccurlye1@php.net', 'UzuiyyQ', '2021-07-08', 4),
('particulier', 'wbernhardi2', 'shuton2@last.fm', 'nJlPCyvDRLFd', '2022-08-08', 1),
('artiste', 'zhackinge3', 'jmaraga3@mac.com', 'VNmD2GcPO2nW', '2021-05-21', 4),
('association', 'tprinne4', 'mlongthorn4@google.com.hk', 'smfOTK84ZO3', '2020-06-24', 6),
('association', 'proskelley5', 'rswigger5@marriott.com', 'f6Bg75VInS', '2021-08-14', NULL),
('association', 'omee6', 'apaskell6@reverbnation.com', '0nm64oBjqNG3', '2020-07-27', 33),
('artiste', 'bbourcq7', 'jsuggitt7@theglobeandmail.com', 'MoKKQPUTTs', '2022-05-12', NULL),
('artiste', 'lmacdearmaid8', 'swilliscroft8@wordpress.org', 's8F6H3W3vH', '2022-06-26', NULL),
('groupe', 'dsarl9', 'hgoncalo9@hugedomains.com', '3GzpIwL', '2020-06-08', NULL),
('particulier', 'iharversona', 'jpiotrkowskia@jiathis.com', 'D1K5vQ', '2022-04-09', 13),
('particulier', 'dladlowb', 'sspadollinib@weibo.com', 'cG4IuWvz301', '2022-02-27', NULL),
('particulier', 'skemeryc', 'edoughartiec@4shared.com', '3pcTSBAj010', '2020-11-03', NULL),
('groupe', 'skuhneld', 'amallindined@icq.com', 'wJbFWka', '2023-04-03', NULL),
('association', 'kpetterse', 'sguenthere@google.co.uk', 't8ZYxT', '2020-07-16', NULL),
('association', 'asiberyf', 'bondrichf@amazon.co.uk', 'zX244dG8qA', '2022-03-20', NULL),
('association', 'gyurkovg', 'acudworthg@goo.ne.jp', 'kB4FK7ozlHO', '2020-03-03', 33),
('particulier', 'bgaffneyh', 'nlewndenh@cornell.edu', 'ySQAjSs', '2022-12-21', NULL),
('association', 'plabitti', 'amccuddeni@e-recht24.de', 'U6UPs6A1bek', '2021-01-08', NULL),
('groupe', 'cworsnupj', 'lmcveyj@sphinn.com', 'o20cDAN', '2022-08-19', 13),
('association', 'cbaddeleyk', 'afrancescucciok@smugmug.com', 'PN1tQO7T7V', '2022-02-26', NULL),
('association', 'jkosl', 'hvittetl@dedecms.com', 'jn5hi3jui9sp', '2022-07-01', NULL),
('association', 'ddrakem', 'labrahartm@shutterfly.com', 'Nes2JH', '2022-09-08', NULL),
('artiste', 'ehartlyn', 'hdellern@nature.com', 'z7aAOMIGQ', '2023-03-07', 22),
('association', 'bfidlero', 'hbaulcombeo@salon.com', 'VSp3g7OH', '2020-09-22', 22),
('particulier', 'ssichardtp', 'schrippesp@desdev.cn', 'PSO7hbH', '2021-12-31', NULL),
('particulier', 'dalwenq', 'clanfearq@dagondesign.com', 'VMilLza', '2023-03-17', 13),
('particulier', 'jscrivnerr', 'lboggasr@4shared.com', 'XdgPFLzo5', '2021-01-12', 33),
('association', 'kingeriths', 'trosenfelts@yellowpages.com', 'UgfNb9oK', '2021-02-23', NULL),
('groupe', 'pdenmeadt', 'nroubottomt@noaa.gov', 'KOhIGSWCA', '2022-11-19', NULL),
('particulier', 'mraviliousu', 'emarleyu@themeforest.net', 'gMuZ7lWkg', '2021-09-12', NULL),
('association', 'afyldesv', 'dplayfootv@reference.com', '6XBQOt', '2021-10-28', NULL),
('particulier', 'trupertw', 'iromaw@scientificamerican.com', 'VX39Qlh6', '2023-03-14', 33),
('association', 'tgironx', 'gmacnockaterx@cbslocal.com', 'fD2BqDa', '2021-08-02', NULL),
('association', 'nzorroy', 'prouty@instagram.com', 'JkVVAcW', '2020-10-17', NULL),
('artiste', 'mfontesz', 'abaldazziz@upenn.edu', 'lZjEEk', '2022-11-25', 33),
('particulier', 'rgraybeal10', 'zivett10@hubpages.com', 'wx6O5EnZM7CY', '2022-08-20', NULL),
('association', 'dnaisey11', 'akenninghan11@amazon.com', '3HW9kF3mong', '2021-01-14', NULL),
('particulier', 'gpym12', 'rmotion12@behance.net', 'K9BtX4S5X', '2021-03-24', NULL),
('particulier', 'mheminsley13', 'dcoaten13@tripadvisor.com', '7QsIF8', '2022-03-20', NULL),
('particulier', 'dsweetzer14', 'hwilshere14@smugmug.com', '12tODrWJbR', '2022-04-01', 13),
('association', 'emaclean15', 'rbatie15@paypal.com', 'wo2bkUEcx', '2020-09-18', NULL),
('association', 'aburch16', 'gduggon16@opensource.org', '3xds1XeFT44w', '2021-01-30', NULL),
('association', 'bpapps17', 'sewles17@sfgate.com', 'nkAdnb4FMxw', '2021-08-20', NULL),
('groupe', 'dellingworth18', 'twalles18@mediafire.com', 'S2jVdsm8t', '2022-05-06', 22),
('groupe', 'epaolazzi19', 'cmacshirie19@sfgate.com', 'tVAB4Y', '2020-01-05', 22),
('artiste', 'ecaen1a', 'gdemonge1a@tripadvisor.com', 'Pw6MGfrO', '2020-06-25', NULL),
('artiste', 'gickowics1b', 'cwillatt1b@dyndns.org', 'sIWOdbgW', '2021-05-25', NULL),
('artiste', 'cbyas1c', 'abraghini1c@cafepress.com', 'MwTZ8o9cnpq', '2020-11-05', NULL),
('association', 'melderton1d', 'apendred1d@nih.gov', 'I2C1tFp93', '2020-05-29', NULL),
('particulier', 'jbalaizot1e', 'dtorbet1e@tinyurl.com', '0ElzOG', '2020-04-05', NULL),
('particulier', 'ffrisdick1f', 'lcollyear1f@cbslocal.com', 'g8YehbFo', '2021-10-19', NULL),
('particulier', 'pgreenmon1g', 'cjerke1g@google.fr', '7F3MXz', '2023-01-19', NULL),
('particulier', 'npairpoint1h', 'bbelfelt1h@ox.ac.uk', '6i6WwVvw1', '2021-01-23', NULL),
('artiste', 'sbyfield1i', 'tbyas1i@washingtonpost.com', 'M4i5eUcd', '2021-06-11', NULL),
('association', 'shassall1j', 'asergison1j@sciencedirect.com', '4Q1appQajq', '2021-01-25', NULL),
('particulier', 'tbysshe1k', 'bibbett1k@desdev.cn', 'wEGrDY3h', '2023-01-22', 33),
('artiste', 'tpautot1l', 'bharvey1l@netscape.com', 'gtOB1u1QJ', '2022-05-17', 33),
('artiste', 'hliverseege1m', 'mmacon1m@wunderground.com', 'RYDxBLZMm', '2022-06-30', 33),
('artiste', 'shaw1n', 'linkle1n@constantcontact.com', '6PmsuS7UqWWb', '2021-05-21', NULL),
('groupe', 'amacleese1o', 'hjoberne1o@umn.edu', 'dvkQuXzAgL', '2021-09-21', NULL),
('artiste', 'aroback1p', 'hmoodie1p@people.com.cn', '1LA7L2bmETE', '2023-01-15', NULL),
('artiste', 'iscaplehorn1q', 'sbeetham1q@washington.edu', 'unqqyKWySih', '2020-06-23', NULL),
('particulier', 'spandya1r', 'dhealks1r@sbwire.com', 'NdYNTQti4lZE', '2020-05-06', NULL),
('artiste', 'bflatley1s', 'khune1s@jalbum.net', 'fYLSmDn', '2021-08-09', NULL),
('artiste', 'cgarrison1t', 'bseleway1t@mashable.com', 'FfhBa8', '2021-05-05', NULL),
('groupe', 'nwayland1u', 'ckornalik1u@wp.com', 'VxtJbch', '2021-10-27', 33),
('artiste', 'jsmullen1v', 'cbrevetor1v@nps.gov', 'P2XtWG3t86', '2022-09-05', NULL),
('artiste', 'cgueinn1w', 'lcasson1w@mapquest.com', 'oiHenVBBp7O', '2021-07-20', NULL),
('artiste', 'ccoxen1x', 'cmcavaddy1x@rakuten.co.jp', 'KyTyyraRwh', '2022-04-16', NULL),
('artiste', 'dackhurst1y', 'kguilliland1y@simplemachines.org', '7fTRwonfCxA', '2021-09-15', NULL),
('particulier', 'pbonefant1z', 'ceveral1z@instagram.com', 'vXHE5RO1mt', '2022-01-13', NULL),
('particulier', 'cmarks20', 'mkondratyuk20@nydailynews.com', 'PK5ou8VKy', '2020-12-02', NULL),
('association', 'cdoag21', 'fdanby21@elegantthemes.com', 'pfpF6o', '2020-11-21', NULL),
('association', 'fsummerly22', 'fethelstone22@mozilla.org', 'fsYTmtO2B', '2023-04-15', NULL),
('artiste', 'nrawlins23', 'jbuche23@phpbb.com', 'EDbSEOG', '2020-08-21', 33),
('association', 'mrummer24', 'sbootman24@hc360.com', 'EECXNE', '2021-07-12', NULL),
('association', 'mwhitely25', 'xdiwell25@nyu.edu', 'T85eBVS', '2021-10-30', NULL),
('particulier', 'bdyson26', 'rmariyushkin26@si.edu', 'm1p7iU', '2023-02-20', NULL),
('groupe', 'wfatharly27', 'canan27@foxnews.com', 'WUlDcrqlEu7', '2022-12-05', NULL),
('association', 'qludlam28', 'tsalters28@jigsy.com', 'wMAGdLsuI', '2022-10-20', NULL),
('association', 'cfoye29', 'gferebee29@angelfire.com', 'vr8n0zlVL', '2020-02-22', NULL),
('association', 'bivankin2a', 'ccatto2a@ow.ly', 'INFTS6U6uW9', '2021-07-17', NULL),
('artiste', 'esivorn2b', 'cdemaid2b@netvibes.com', 'qEKDbdH', '2020-02-22', NULL),
('particulier', 'cguisby2c', 'phamshar2c@blog.com', 'IHzgoVWP', '2022-09-21', NULL),
('association', 'ljacop2d', 'vgallemore2d@indiegogo.com', 'dXrAsx', '2021-01-05', NULL),
('artiste', 'ggoodinge2e', 'mswigger2e@yandex.ru', 'yst01e928S', '2021-07-29', NULL),
('artiste', 'cdeancywillis2f', 'jgidman2f@soup.io', 'L8k9OxVWkrqn', '2020-01-09', NULL),
('particulier', 'balenov2g', 'feverest2g@vkontakte.ru', 'CC6KyL', '2022-07-10', 33),
('groupe', 'gdyble2h', 'dsturzaker2h@wisc.edu', 'avPX47n1vQ', '2020-02-18', 33),
('artiste', 'ltravers2i', 'jmack2i@so-net.ne.jp', 'B9RcRm59W', '2020-03-04', NULL),
('artiste', 'lchenery2j', 'tgamwell2j@godaddy.com', 'hVHVVyE', '2021-10-23', NULL),
('artiste', 'kfoux2k', 'apavese2k@wikispaces.com', 'cSAfTw0', '2022-05-03', NULL),
('particulier', 'vpender2l', 'nkalberer2l@economist.com', 'dSyCiw5G', '2021-04-13', NULL),
('association', 'jmartynikhin2m', 'dludy2m@people.com.cn', 'JXvMYDUMq6', '2021-03-31', NULL),
('artiste', 'hbroddle2n', 'rsproule2n@domainmarket.com', '19qPVs', '2021-03-02', NULL),
('groupe', 'obernhardt2o', 'abenford2o@twitter.com', 'bphVwSTsfzC8', '2022-09-09', NULL),
('groupe', 'rpiquard2p', 'gmccumskay2p@linkedin.com', 'V73CjIWdD', '2021-11-07', NULL),
('association', 'lscogings2q', 'smatton2q@topsy.com', 'UuoaxapY', '2022-05-22', 33),
('artiste', 'ktregea2r', 'lhathwood2r@sbwire.com', 'kZGkt3ONHDb', '2022-12-18', NULL);


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

--Artistes
INSERT INTO Artistes (Nom) VALUES
('Queen'),
('The Beatles'),
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

INSERT INTO Concert (lieu, prix, organisateurs, lineup, nb_places, besoin_benevoles, cause, exterieur, enfants, avis, date) VALUES
('Paris', 25, 7, NULL,5000, true, 'Charity event for childrens hospital', false, true, NULL, '2022-01-01'),
('Lyon', 20, 8, NULL,2000, false, 'Music festival', true, false, NULL, '2022-02-01'),
('Marseille', 9, 28, NULL,10000, true, 'Fundraiser for local sports club', true, false, NULL, '2022-03-01'),
('Toulouse', 12.5, 10, NULL,3000, true, 'Electronic music festival', true, false, NULL, '2022-04-01'),
('Nice', 30, 11, NULL,5000, false, 'Outdoor music festival', true, true, NULL, '2022-05-01'),
('Nantes', 22, 12, NULL,15000, true, 'Heavy metal music festival', false, false, NULL, '2022-06-01'),
('Strasbourg', 18, 13, NULL,2500, false, 'Classical music concert', false, true, NULL, '2022-07-01'),
('Montpellier', 10, 14, NULL,500, true, 'Summer music festival', true, true, NULL, '2022-08-01'),
('Bordeaux', 27.5, 15, NULL,3000, true, 'Rock music festival', false, false, NULL, '2022-09-01'),
('Lille', 17.5, 16, NULL,2500, true, 'Indie rock music festival', true, false, NULL, '2022-10-01'),
('Rennes', 13, 17, NULL,2000, true, 'Multidisciplinary arts festival', false, true, NULL, '2022-11-01'),
('Reims', 20, 18, NULL,1000, false, 'Classical music festival', false, false, NULL, '2022-12-01'),
('Le Havre', 8, 19, NULL,500, false, 'Summer music festival', true, true, NULL, '2023-01-01'),
('Saint-Etienne', 25, 20, NULL,4000, true, 'Music and spoken word festival', true, false, NULL, '2023-02-01'),
('Grenoble', 14.5, 21, NULL,3000, true, 'Pop and electronic music festival', false, false, NULL, '2023-03-01');

INSERT INTO Lineup (concert, artiste) VALUES 
(1, 1),(1, 2),(2, 3),(2, 4),(2, 5),(2, 6),(3, 7),(3, 8),(4, 9),(4, 10),(4, 11),(5, 12),(5, 13),(5, 14),
(5, 15),(6, 16),(7, 17),(7, 18),(7, 19),(7, 20),(8, 21),(8, 22),(9, 23),(9, 24),(9, 25),(10, 26),(11, 27),
(12, 28),(13, 29),(13, 30),(13, 31),(14, 32),(15, 33),(15, 34),(15, 35),(15, 36);

UPDATE Concert SET lineup = Lineup.concert FROM Lineup WHERE Lineup.concert = Concert.cid;

insert into Participer (concert, utilisateur, type_participation) values
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

---Morceaux ---

INSERT INTO Morceaux (nom, duree, artiste, avis) VALUES
('Bohemian Rhapsody', 354, 1, NULL),
('Imagine', 182, 2, NULL),
('Billie Jean', 295, 3, NULL),
('Back in Black', 255, 4, NULL),
('Jailhouse Rock', 156, 5, NULL),
('Another Brick in the Wall', 362, 6, NULL),
('Stairway to Heaven', 482, 7, NULL),
('With or Without You', 299, 8, NULL),
('Like a Prayer', 334, 9, NULL),
('Smells Like Teen Spirit', 302, 10, NULL),
('No Woman, No Cry', 236, 11, NULL),
('Enter Sandman', 332, 12, NULL),
('Space Oddity', 315, 13, NULL),
('Satisfaction', 223, 14, NULL),
('Sweet Child O'' Mine', 356, 15, NULL),
('My Generation', 225, 16, NULL),
('Purple Rain', 527, 17, NULL),
('Born in the USA', 252, 18, NULL),
('Lose Yourself', 341, 19, NULL),
('Crazy in Love', 235, 20, NULL),
('Paranoid Android', 384, 21, NULL),
('Superstition', 268, 22, NULL),
('All Along the Watchtower', 244, 23, NULL),
('Riders on the Storm', 413, 24, NULL),
('Under the Bridge', 265, 25, NULL),
('Tears in Heaven', 283, 26, NULL),
('Piece of My Heart', 269, 27, NULL),
('Like a Rolling Stone', 366, 28, NULL),
('Bohemian Rhapsody', 354, 1, NULL),
('Fly Me to the Moon', 179, 29, NULL),
('So What', 320, 30, NULL),
('Imagine', 182, 2, NULL),
('Folsom Prison Blues', 170, 31, NULL),
('Englishman in New York', 293, 32, NULL),
('Rocket Man', 296, 33, NULL),
('A Change Is Gonna Come', 196, 34, NULL);

---Playlist---
INSERT INTO Playlist (utilisateur, nom, nb_morceaux, avis) VALUES
(1, 'Playlist de rock', 15, NULL),
(2, 'Mes chansons préférées', 10, NULL),
(3, 'Hits du moment', 8, NULL),
(1, 'Classiques indémodables', 20, NULL),
(4, 'Hip Hop en feu', 12, NULL),
(5, 'Jazz et Blues', 18, NULL),
(2, 'Chill et détente', 7, NULL),
(6, 'Latino caliente', 11, NULL),
(7, 'Pop internationale', 9, NULL),
(8, 'Rap US', 14, NULL),
(9, 'Country love songs', 16, NULL),
(10, 'Musique électronique', 22, NULL),
(11, 'Reggae roots', 13, NULL),
(12, 'Classique contemporain', 25, NULL),
(13, 'Funk et Soul', 17, NULL),
(14, 'Chansons françaises', 19, NULL),
(15, 'Musique orientale', 10, NULL),
(16, 'Métal extrême', 8, NULL),
(17, 'Ambiance lounge', 12, NULL),
(18, 'Musique indienne', 16, NULL),
(19, 'Blues rock', 14, NULL),
(20, 'Musique celtique', 11, NULL),
(21, 'Indie pop', 9, NULL),
(22, 'R&B moderne', 13, NULL),
(23, 'Musique africaine', 15, NULL),
(24, 'Rock alternatif', 18, NULL),
(25, 'Musique asiatique', 10, NULL),
(26, 'Pop acoustique', 7, NULL),
(27, 'Musique brésilienne', 11, NULL),
(28, 'Hard rock', 14, NULL),
(29, 'Musique traditionnelle', 16, NULL),
(30, 'Musique pour la méditation', 9, NULL),
(31, 'Chants religieux', 12, NULL),
(32, 'Rock progressif', 17, NULL),
(33, 'Musique pour le sport', 10, NULL),
(34, 'Musique pour étudier', 8, NULL);

INSERT INTO Create_playlist(pid,uid)
SELECT pid, utilisateur FROM Playlist;

---Playlist_Morceaux ---
INSERT INTO Playlist_Morceaux (pid, mid) VALUES
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
INSERT INTO Avis_Concert (concert,utilisateur,note, commentaire) VALUES 
(5,8,3, 'Le concert était moyen'),
(6,7,4, 'Bonne ambiance mais le son était un peu faible'),
(3,7,5, 'Excellent concert, j''ai adoré !'),
(5,9,2, 'Déçu, je m''attendais à mieux'),
(8,2,3, 'Pas mal mais pas inoubliable non plus'),
(1,4,4, 'Très bonne performance des artistes'),
(1,6,1, 'Très mauvaise expérience, je ne recommande pas du tout'),
(7,3,5, 'Un des meilleurs concerts que j''ai pu voir'),
(9,1,4, 'Très bon choix de morceaux, j''ai passé un super moment'),
(2,4,3, 'Le concert était correct, sans plus');

---Avis Playlists---
INSERT INTO Avis_Playlist (playlist,utilisateur,note, commentaire) VALUES
(7,3,4, 'J''aime beaucoup cette playlist'),
(7,6,3, 'Certains morceaux ne sont pas à mon goût'),
(6,2,5, 'La meilleure playlist jamais créée!'),
(4,3,2, 'Je ne suis pas fan de cette sélection'),
(1,4,4, 'Il y a quelques morceaux que j''adore dans cette playlist'),
(5,3,1, 'Je n''aime aucun des morceaux de cette playlist'),
(2,5,5, 'C''est exactement ce que j''attendais d''une playlist!'),
(1,2,3, 'Il y a quelques morceaux que j''aime bien'),
(3,9,4, 'Bonne playlist pour travailler'),
(5,7,2, 'Je ne comprends pas pourquoi ces morceaux sont dans cette playlist'),
(8,8, 5, 'Je pourrais écouter cette playlist en boucle toute la journée'),
(7,1,3, 'Il y a des morceaux que je ne connaissais pas et que j''aime bien'),
(6,2,1, 'Je ne recommanderais pas cette playlist à quiconque'),
(5,3,4, 'Très bon choix de morceaux pour une soirée entre amis'),
(2,6,2, 'Je n''aime pas du tout cette playlist'),
(1,5,5, 'Cette playlist me met toujours de bonne humeur!'),
(7,4,3, 'Il y a quelques morceaux que j''ai déjà entendus trop souvent'),
(8,6,4, 'Bonne playlist pour faire du sport'),
(4,1,2, 'Je trouve que certains morceaux ne vont pas ensemble'),
( 3,2,5, 'J''adore tous les morceaux de cette playlist!');

--Avis_Morceaux---
INSERT INTO Avis_Morceaux (morceau, utilisateur, note, commentaire) VALUES
(2,32,4, 'Très bon morceau, je le recommande !'),
(7,82,3, 'Sympathique, mais sans plus.'),
(8,43,5, 'Le meilleur morceau de l''album, une vraie pépite !'),
(5,66,2, 'Décevant, je m''attendais à mieux.'),
(1,100,1, 'Nul, je ne comprends pas pourquoi il est sur l''album.'),
(12,76,4, 'Un morceau qui met de bonne humeur, parfait pour commencer la journée.'),
(30,29,3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(14,40,5, 'Sublime, il me donne des frissons à chaque écoute.'),
(18,29,2, 'Mauvais, j''ai vite zappé ce morceau.'),
(32,74,1, 'Affreux, je ne comprends pas comment il a pu être enregistré.'),
(28,81,4, 'Un morceau qui donne la pêche, je l''écoute en boucle.'),
(22,22,3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(11,31,5, 'Sublime, il me donne des frissons à chaque écoute.'),
(12,42,2, 'Mauvais, j''ai vite zappé ce morceau.'),
(5,66,1, 'Affreux, je ne comprends pas comment il a pu être enregistré.'),
(35,92,4, 'Un morceau qui donne la pêche, je l''écoute en boucle.'),
(6,67,3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(21,90,5, 'Sublime, il me donne des frissons à chaque écoute.'),
(33,13,2, 'Mauvais, j''ai vite zappé ce morceau.'),
(32,120,1, 'Affreux, je ne comprends pas comment il a pu être enregistré.'),
(36,43,4, 'Un morceau qui donne la pêche, je l''écoute en boucle.'),
(17,78,3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(10,100,5, 'Sublime, il me donne des frissons à chaque écoute.'),
(13,95,2, 'Mauvais, j''ai vite zappé ce morceau.'),
(32,2,1, 'Affreux, je ne comprends pas comment il a pu être enregistré.'),
(27,89,4, 'Un morceau qui donne la pêche, je l''écoute en boucle.'),
(25,3,3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(34,24,5, 'Sublime, il me donne des frissons à chaque écoute.'),
(3,82,2, 'Mauvais, j''ai vite zappé ce morceau.'),
(8,92,1, 'Affreux, je ne comprends pas comment il a pu être enregistré.'),
(25,12,4, 'Un morceau qui donne la pêche, je l''écoute en boucle.'),
(17,63,3, 'Pas mal, mais je préfère d''autres titres de l''artiste.'),
(19,66,5, 'Sublime, il me donne des frissons à chaque fois');

---Avis "Artistes "---
INSERT INTO Avis_Artistes (artiste, utilisateur, note, commentaire) VALUES
(1,8,4, 'J''adore cet artiste, sa musique me transporte.'),
(5,9,5, 'Cet artiste est tout simplement incroyable, il sait toucher le coeur de son public.'),
(3,3,3, 'Je trouve que cet artiste manque un peu d''originalité.'),
(2,3,2, 'Je ne suis pas fan de cet artiste, je trouve sa musique trop commerciale.'),
(6,2,1, 'Je n''aime pas du tout cet artiste, je trouve sa musique insipide.'),
(2,6,5, 'Cet artiste est une vraie révélation, j''ai été ému aux larmes lors de son dernier concert.'),
(7,1,4, 'Très bon artiste, j''ai passé une excellente soirée lors de son concert.'),
(1,3,3, 'Je ne suis pas convaincu par cet artiste, je trouve que sa musique manque d''âme.'),
(4,6,4, 'Cet artiste a un véritable talent, je suis impatient de le revoir sur scène.'),
(2,8,2, 'Je n''ai pas du tout accroché à cet artiste, je trouve sa musique fade et sans intérêt.'),
(5,5,5, 'Un artiste d''exception, j''ai été transporté par sa prestation.'),
(6,1,3, 'Je suis partagé quant à cet artiste, certaines de ses chansons sont excellentes, d''autres beaucoup moins.'),
(7,2,4, 'Cet artiste a un vrai potentiel, j''ai hâte de voir comment il va évoluer.'),
(3,9,2, 'Je n''ai pas aimé cet artiste, je trouve sa musique trop répétitive.'),
(2,4,1, 'Je déteste cet artiste, je trouve sa musique insupportable.'),
(7,7,5, 'Un artiste hors du commun, sa musique est un véritable enchantement.'),
(1,7,4, 'Un très bon artiste, j''ai passé une excellente soirée lors de son dernier concert.'),
(3,6,3, 'Je suis mitigé quant à cet artiste, il a du talent mais je trouve que sa musique manque de profondeur.'),
(2,4,2, 'Je ne suis pas du tout fan de cet artiste, je trouve sa musique banale et sans saveur.'),
(8,4,5, 'Cet artiste est tout simplement exceptionnel, j''ai été transporté par sa prestation.');

---Avis Groupes---
INSERT INTO Avis_Groupes (groupe, utilisateur, note, commentaire) VALUES
(2,3,4, 'J''ai été agréablement surpris par la qualité de leur prestation lors du dernier concert.'),
(4,5,3, 'Je trouve que leur dernier single manque d''originalité.'),
(1,9,5, 'Ce groupe est incroyable! Je suis un grand fan!'),
(1,6,2, 'Je n''ai pas du tout apprécié leur dernier album.'),
(3,9,4, 'Le concert était excellent! Ils ont vraiment mis le feu!'),
(2,2,5, 'Leur dernier clip est une oeuvre d''art!'),
(1,7,3, 'Leur prestation lors du festival était correcte, sans plus.'),
(8,3,1, 'Je suis extrêmement déçu de leur dernier album. Je ne recommande pas.'),
(9,3,2, 'Je trouve que leur musique manque de cohérence.'),
(6,1,4, 'J''ai passé un bon moment lors de leur dernier concert.');

UPDATE Playlist SET avis = Avis_Playlist.aid FROM Avis_Playlist WHERE Avis_Playlist.playlist = Playlist.pid;
UPDATE Morceaux SET avis = Avis_Morceaux.aid FROM Avis_Morceaux WHERE Avis_Morceaux.morceau = morceaux.mid;
UPDATE Artistes SET avis = Avis_Artistes.aid FROM Avis_Artistes WHERE Avis_Artistes.artiste = Artistes.aid;
UPDATE Concert SET avis = Avis_Concert.aid FROM Avis_Concert WHERE Avis_Concert.concert = Concert.cid;

INSERT INTO Groupes(utilisateur,type_user,pseudo,email,mdp,date_inscription,tag)
SELECT * FROM Users WHERE type_user = 'groupe';

UPDATE Groupes SET avis = Avis_Groupes.aid FROM Avis_Groupes WHERE Avis_Groupes.groupe = Groupes.gid;


INSERT INTO Tournee (artiste, date_debut, date_fin) VALUES
(1, '2023-06-01', '2023-06-10'),
(2, '2023-06-15', '2023-06-20'),
(3, '2023-07-01', '2023-07-05'),
(4, '2023-07-10', '2023-07-20'),
(5, '2023-08-01', '2023-08-10'),
(6, '2023-08-15', '2023-08-20'),
(7, '2023-09-01', '2023-09-05'),
(8, '2023-09-10', '2023-09-20'),
(9, '2023-10-01', '2023-10-10'),
(10, '2023-10-15', '2023-10-20'),
(11, '2023-11-01', '2023-11-05'),
(12, '2023-11-10', '2023-11-20'),
(13, '2023-12-01', '2023-12-10'),
(14, '2023-12-15', '2023-12-20'),
(15, '2024-01-01', '2024-01-05');

INSERT INTO TourneeDates (tournee, concert, date) VALUES
(1, 1, '2023-06-01'),
(1, NULL, '2023-06-02'),
(1, 2, '2023-06-03'),
(1, 3, '2023-06-05'),
(2, 4, '2023-06-15'),
(2, 5, '2023-06-17'),
(2, 6, '2023-06-19'),
(3, 7, '2023-07-01'),
(3, 8, '2023-07-03'),
(3, 9, '2023-07-05'),
(4, 10, '2023-07-10'),
(4, 11, '2023-07-13'),
(4, 12, '2023-07-15'),
(5, 13, '2023-08-01'),
(5, 14, '2023-08-04'),
(5, 15, '2023-08-07'),
(9, 2, '2023-06-03'),
(9, 3, '2023-06-05'),
(9, 4, '2023-06-15');


INSERT INTO Archive (concert, lieu, prix, organisateurs, lineup, nb_places, besoin_benevoles, cause, exterieur, enfants, avis, date) VALUES
(1, 'Paris', 25, 7, NULL,5000, true, 'Charity event for childrens hospital', false, true, NULL, '2022-01-01'),

(5, 'Nice', 30, 11, NULL,5000, false, 'Outdoor music festival', true, true, NULL, '2022-05-01'),

(7, 'Strasbourg', 18, 13, NULL,2500, false, 'Classical music concert', false, true, NULL, '2022-07-01'),

(10, 'Lille', 17.5, 16, NULL,2500, true, 'Indie rock music festival', true, false, NULL, '2022-10-01'),

(15, 'Grenoble', 14.5, 21, NULL,3000, true, 'Pop and electronic music festival', false, false, NULL, '2023-03-01');


UPDATE Archive SET lineup = Lineup.concert FROM Lineup WHERE Lineup.concert = Archive.concert;
UPDATE Archive SET avis = Avis_Concert.aid FROM Avis_Concert WHERE Avis_Concert.concert = Archive.concert;

INSERT INTO Archiver (cid) VALUES(1),(5),(7),(10),(15);
INSERT INTO Organise_concert (organisateurs) VALUES (7), (8), (28) ,(10), (11) ,(12), (13), (14), (15), (16), (17), (18), (19), (20), (21);

INSERT INTO Avis(aid, utilisateur, type_avis)
SELECT aid, utilisateur, type_avis FROM avis_groupes
UNION
SELECT aid, utilisateur, type_avis FROM avis_artistes
UNION
SELECT aid, utilisateur, type_avis FROM avis_morceaux
UNION
SELECT aid, utilisateur, type_avis FROM avis_concert
UNION
SELECT aid, utilisateur, type_avis FROM avis_playlist;


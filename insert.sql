INSERT INTO genre (genre_name)
VALUES ('Rock'),
('Pop'),
('Folk'),
('Ambient'),
('Classic');

INSERT INTO artist (artist_name)
VALUES ('Artist1'),
('Artist2'),
('Artist With Long Name'),
('The Band1'),
('The Band2'),
('Classical Artist'),
('Multi-Genre Artist'),
('Artist3');

INSERT INTO genres_of_artists (artist_id, genre_id)
VALUES (1,2),
(2,2),
(3,3),
(3,1),
(4,1),
(5,2),
(6,5),
(7,1),
(7,4),
(7,2),
(8,4);

INSERT INTO album (title, release_year)
VALUES ('Artist1 Album',2015),
('Artist2 Album', 2018),
('Artist With Long Name Album',2019),
('The Band1 Album', 2017),
('The Band2', 2020),
('Classical Artist Album1', 2021),
('Classical Artist Album2', 2015),
('Multi-Genre Artist Album', 2020),
('Artist3 Album', 2018);

INSERT INTO albums_of_artists (artist_id, album_id)
VALUES (1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(6,7),
(7,8),
(8,9),
(1,8);

INSERT INTO track (title, duration, album_id)
VALUES ('Q1',180, 1),
('Q2', 176, 1),
('Q1 (reprise)',120, 1),
('A1', 175, 2),
('A2', 164, 2),
('B1', 189, 3),
('C1', 187, 4),
('D1', 233, 5),
('Q1', 80, 5),
('D2', 210, 5),
('E1', 185, 6),
('E2',157, 6),
('B1', 311, 7),
('F1', 298, 7),
('F1 (feat Artist 1)', 613, 8),
('G1', 153, 9),
('G2', 164, 9),
('G3', 211, 9),
('Q3 my Q3',187, 1),
('F2 домой', 176, 7);

INSERT INTO collection (title, release_year)
VALUES ('Collection 1',2015),
('Colection 2', 2018),
('Collection 3',2019),
('Collection 4', 2017),
('Collection 5', 2020),
('Collection 6', 2021),
('Collection 7', 2015),
('Collection 8', 2020);

INSERT INTO tracks_in_collections (track_id, collection_id)
VALUES (1,1),
(2,1),
(2,2),
(18,2),
(15,2),
(15,3),
(10,3),
(1,4),
(5,4),
(4,4),
(14,5),
(11,5),
(12,6),
(1,7),
(15,7),
(8,7),
(7,7),
(7,8),
(8,8),
(19,5),
(20,5),
(20,8);
-- название и год выхода альбомов, вышедших в 2018 году;

SELECT title, release_year
FROM album
WHERE release_year = 2018;

-- название и продолжительность самого длительного трека;

SELECT title, duration 
FROM track
ORDER BY duration DESC
LIMIT 1;

-- название треков, продолжительность которых не менее 3,5 минуты;

SELECT title
FROM track
WHERE duration >= 210;

-- названия сборников, вышедших в период с 2018 по 2020 год включительно;

select title 
FROM collection
WHERE release_year BETWEEN 2018 AND 2020;

-- исполнители, чье имя состоит из 1 слова;

SELECT artist_name 
FROM artist
WHERE artist_name NOT LIKE '% %';

-- название треков, которые содержат слово "мой"/"my".

SELECT title 
FROM track
WHERE lower(title) LIKE '%my%' OR 
	  lower(title) LIKE '%мой%';
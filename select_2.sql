-- количество исполнителей в каждом жанре;
SELECT g.genre_name, COUNT(*) 
  FROM genre g
       JOIN genres_of_artists goa 
       ON g.genre_id = goa.genre_id
 GROUP BY g.genre_name;

-- количество треков, вошедших в альбомы 2019-2020 годов;
SELECT COUNT(*) 
  FROM track t 
       JOIN album a 
       ON a.album_id = t.album_id
 WHERE a.release_year BETWEEN 2019 AND 2020;

-- средняя продолжительность треков по каждому альбому;
SELECT a.title, AVG(t.duration) 
  FROM album a 
       JOIN track t 
       ON t.album_id = a.album_id 
 GROUP BY a.title
 ORDER BY a.title ASC;

-- все исполнители, которые не выпустили альбомы в 2020 году;
SELECT artist_name  
  FROM artist
 WHERE artist_id NOT IN 
       (SELECT aoa.artist_id 
          FROM albums_of_artists aoa 
               JOIN album a 
               ON aoa.album_id = a.album_id
	 WHERE a.release_year = 2020);

-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT DISTINCT c.title 
  FROM collection c 
       JOIN tracks_in_collections tic 
       ON c.collection_id = tic.collection_id
	   
       JOIN track t 
       ON t.track_id = tic.track_id
	   
       JOIN albums_of_artists aoa 
       ON aoa.album_id = t.album_id
	   
       JOIN artist a 
       ON aoa.artist_id =a.artist_id
 WHERE a.artist_name = 'The Band1'
 ORDER BY c.title;

-- название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT a.title
  FROM album a 
       JOIN albums_of_artists aoa 
       ON a.album_id = aoa.album_id 
 WHERE aoa.artist_id IN 
       (SELECT goa.artist_id
          FROM genres_of_artists goa
         GROUP BY goa.artist_id
        HAVING COUNT(*) > 1);

-- наименование треков, которые не входят в сборники;
SELECT title 
  FROM track
 WHERE track_id NOT IN 
       (SELECT DISTINCT track_id
          FROM tracks_in_collections tic);

-- исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT a.artist_name 
  FROM artist a 
       JOIN albums_of_artists aoa 
       ON aoa.artist_id =a.artist_id
	   
       JOIN track t 
       ON t.album_id = aoa.album_id
 WHERE t.duration = (SELECT MIN(duration)
                       FROM track);

-- название альбомов, содержащих наименьшее количество треков.
SELECT a.title
  FROM album a 
       JOIN track t 
       ON t.album_id = a.album_id
 GROUP BY a.title
HAVING COUNT(*) = 
       (SELECT COUNT(*)
          FROM track
         GROUP BY album_id
         ORDER BY COUNT
         LIMIT 1);

SELECT g.name, COUNT(*) FROM genre g
JOIN genreartist ga ON g.id = ga.genre_id
GROUP BY g.name;

SELECT COUNT(*) FROM album a
JOIN track t ON a.id = t.album_id
WHERE a.yearalbum BETWEEN 2018 AND 2020;

SELECT a.name, AVG(t.duration) FROM album a
JOIN track t ON a.id = t.album_id
GROUP BY a.name;

SELECT ar.name FROM artist ar
EXCEPT DISTINCT SELECT ar.name FROM artist ar
JOIN albumartist aa ON ar.id = aa.artist_id
JOIN album al ON aa.album_id = al.id
WHERE al.yearalbum = 2020;

SELECT DISTINCT c.name FROM collection c
JOIN trackcollections tc ON c.id = tc.collection_id
JOIN track t ON tc.track_id = t.id
JOIN album al ON t.album_id = al.id
JOIN albumartist aa ON al.id = aa.album_id
JOIN artist ar ON aa.artist_id = ar.id
WHERE ar.name LIKE '%Motorhead%';

SELECT al.name FROM album al
JOIN albumartist aa ON al.id = aa.album_id
JOIN artist ar ON aa.artist_id = ar.id
JOIN genreartist ga ON ar.id = ga.artist_id
GROUP BY al.name
HAVING COUNT(ga.genre_id) > 1;

SELECT t.name FROM track t
LEFT JOIN trackcollections tc ON t.id = tc.track_id
LEFT JOIN collection c ON tc.collection_id = c.id
GROUP BY t.name
HAVING COUNT(c.id) < 1;

SELECT ar.name FROM artist ar
JOIN albumartist aa ON ar.id = aa.artist_id
JOIN album al ON aa.album_id = al.id
JOIN track t ON al.id = t.album_id
WHERE t.duration = (SELECT MIN(t.duration) FROM track t);

SELECT al.name AS count_trek
FROM album al
JOIN track t ON al.id = t.album_id
GROUP BY al.name
HAVING COUNT(t.name) = (SELECT COUNT(t.name) AS count_t
FROM album al
JOIN track t ON al.id = t.album_id
GROUP BY al.name
ORDER BY count_t
LIMIT 1);

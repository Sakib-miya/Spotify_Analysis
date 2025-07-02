create database spotify;
use spotify;
select * from spotify_project;
-- 1. Get all track names with more than 1 billion streams
SELECT Track 
FROM spotify_project 
WHERE Stream > 1000000000;

-- 2. List all unique albums along with their respective artists
SELECT DISTINCT Album, Artist 
FROM spotify_project;

-- 3. Total number of comments for tracks where licensed = TRUE
SELECT SUM(Comments) AS total_comments 
FROM spotify_project 
WHERE Licensed = TRUE;

-- 4. Find all track names that belong to album type 'single'
SELECT Track 
FROM spotify_project 
WHERE LOWER(Album_type) = 'single';

-- 5. Count total number of unique tracks by each artist
SELECT Artist, COUNT(DISTINCT Track) AS track_count 
FROM spotify_project 
GROUP BY Artist 
ORDER BY track_count DESC;

-- 6. Average danceability of tracks in each album
SELECT Album, ROUND(AVG(Danceability), 3) AS avg_danceability 
FROM spotify_project 
GROUP BY Album;

-- 7. Top 5 tracks with the highest energy values
SELECT Track, Energy 
FROM spotify_project 
ORDER BY Energy DESC 
LIMIT 5;

-- 8. List tracks with views and likes where official_video is TRUE
SELECT Track, Views, Likes 
FROM spotify_project 
WHERE official_video = TRUE;

-- 9. Total views of tracks grouped by album
SELECT Album, SUM(Views) AS total_views 
FROM spotify_project 
GROUP BY Album;

-- 10. Tracks where Spotify streams are greater than YouTube views
SELECT Track 
FROM spotify_project 
WHERE Stream > Views;

-- 11. Top 3 most-viewed tracks for each artist using window function
SELECT Artist, Track, Views
FROM (
  SELECT Artist, Track, Views,
         RANK() OVER (PARTITION BY Artist ORDER BY Views DESC) AS rank_position
  FROM spotify_project
) AS ranked
WHERE rank_position <= 3;

-- 12. Tracks with liveness greater than the average liveness
SELECT Track 
FROM spotify_project 
WHERE Liveness > (SELECT AVG(Liveness) FROM spotify_project);

-- 13. Energy difference (max - min) per album using WITH clause
WITH energy_cte AS (
  SELECT Album,
         MAX(Energy) AS highest_energy,
         MIN(Energy) AS lowest_energy
  FROM spotify_project
  GROUP BY Album
)
SELECT Album, 
       ROUND(highest_energy - lowest_energy, 3) AS energy_difference
FROM energy_cte
ORDER BY energy_difference DESC;

-- 14. Tracks where energy-to-liveness ratio is greater than 1.2
SELECT Track 
FROM spotify_project 
WHERE Liveness > 0 AND (Energy / Liveness) > 1.2;

-- 15. Cumulative sum of likes ordered by views
SELECT Track, Views, Likes,
       SUM(Likes) OVER (ORDER BY Views) AS cumulative_likes
FROM spotify_project;

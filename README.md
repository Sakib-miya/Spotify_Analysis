# 🎧 Spotify SQL Analysis Project

![Spotify Banner](https://storage.googleapis.com/pr-newsroom-wp/1/2023/11/Spotify_Logo_RGB_Green.png)

## 📊 Overview

This project explores a Spotify dataset using **SQL** to uncover insights about tracks, artists, albums, and performance metrics. The goal is to practice SQL skills with real-world music data — identifying popular tracks, analyzing trends, and applying advanced window functions.

> 💡 This is an educational project built using pure SQL queries on a table named `spotify_project`.

---

## 📁 Dataset

The dataset includes information such as:
- Track names
- Artist and album details
- Streams and views (Spotify & YouTube)
- Likes, comments, and official video status
- Audio features like **energy**, **danceability**, and **liveness**

---

## ✅ SQL Tasks Covered

- Filter tracks with > 1 billion streams  
- Count total comments on licensed tracks  
- Find all tracks from album type 'single'  
- Count tracks per artist  
- Calculate average danceability per album  
- Identify top 5 high-energy tracks  
- Compare Spotify streams vs. YouTube views  
- Window functions: top 3 viewed tracks per artist  
- Energy-to-liveness ratio and more...

---

## 🔍 Sample Queries

```sql
-- Top 5 tracks with the highest energy
SELECT Track, Energy 
FROM spotify_project 
ORDER BY Energy DESC 
LIMIT 5;

-- Average danceability for each album
SELECT Album, ROUND(AVG(Danceability), 3) AS avg_danceability 
FROM spotify_project 
GROUP BY Album;

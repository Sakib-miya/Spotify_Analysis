# 🎧 Spotify SQL Analysis Project

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/1/19/Spotify_logo_without_text.svg" alt="Spotify Logo" width="120" />
</p>

> 🧠 Explore insights from Spotify using powerful SQL queries.

---

## 📌 Overview

This project is a SQL-based deep-dive into a Spotify dataset containing track metadata, streaming stats, and audio features. It’s perfect for practicing SQL queries ranging from basic filtering to advanced window functions.

The goal is to extract meaningful insights about tracks, artists, albums, and listener behavior using pure SQL.

---

## 🧾 Dataset Description

The table is named `spotify_project` and includes:

- 🎵 Track & Artist Info  
- 💿 Album type and name  
- 📈 Spotify Streams & YouTube Views  
- ❤️ Likes, 💬 Comments  
- 🎧 Audio features: Energy, Danceability, Liveness  
- 📹 Official video status  
- ✅ Licensing information  

---

## 🛠️ Key Features

- Filter tracks with over 1 billion streams  
- Compare Spotify and YouTube popularity  
- Aggregate comments and likes  
- Use subqueries and window functions  
- Calculate energy-to-liveness ratios  
- Rank top tracks by artist using `RANK()`  
- Explore album-level averages and stats  

---

## 📚 Sample SQL Queries

```sql
-- Get tracks with over 1 billion streams
SELECT Track 
FROM spotify_project 
WHERE Stream > 1000000000;

-- Average danceability per album
SELECT Album, ROUND(AVG(Danceability), 3) AS avg_danceability 
FROM spotify_project 
GROUP BY Album;

-- Top 3 viewed tracks per artist
SELECT Artist, Track, Views
FROM (
  SELECT Artist, Track, Views,
         RANK() OVER (PARTITION BY Artist ORDER BY Views DESC) AS rnk
  FROM spotify_project
) AS ranked
WHERE rnk <= 3;

CREATE DATABASE IF NOT EXISTS cdg_hyd_jfs_058;
USE cdg_hyd_jfs_058;

CREATE TABLE IF NOT EXISTS movies (
    movie_code VARCHAR(20) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    original_language VARCHAR(50) NOT NULL,
    release_date DATE,
    duration_minutes INT NOT NULL,
    director_name VARCHAR(100) NOT NULL,
    age_certificate VARCHAR(30),
    audience_rating DECIMAL(3,1),
    production_budget DECIMAL(15,2),
    catalog_status VARCHAR(20) NOT NULL
);

SELECT * FROM movies;
DELETE FROM movies;


INSERT INTO movies
(movie_code,title,genre,original_language,release_date,duration_minutes,director_name,age_certificate,audience_rating,production_budget,catalog_status)
VALUES
('MOV26001','River Beyond the Hills','Drama','Hindi','2026-01-16',132,'Anika Verma','PARENTAL_GUIDANCE',8.2,35000000.00,'RELEASED'),
('MOV26002','Orbit Seven','Science Fiction','English','2026-05-22',148,'Daniel Cole','PARENTAL_GUIDANCE',7.6,120000000.00,'RELEASED'),
('MOV26003','Little Mango Tree','Animation','Telugu','2026-07-10',96,'Ravi Teja','ALL_AGES',8.5,18000000.00,'RELEASED'),
('MOV27001','Echoes of Tomorrow','Thriller','English',NULL,125,'Maya Sen','UNRATED',NULL,NULL,'UPCOMING'),
('MOV24005','Old Harbour','Mystery','Bengali','2024-02-09',118,'Sayan Dutta','ADULT',6.9,22000000.00,'ARCHIVED');

UPDATE movies SET release_date='2027-03-19',age_certificate='PARENTAL_GUIDANCE' WHERE movie_code='MOV27001';
UPDATE movies SET audience_rating=8.8 WHERE movie_code='MOV26003';
UPDATE movies SET production_budget=production_budget*1.05 WHERE genre='Science Fiction' AND production_budget IS NOT NULL;
UPDATE movies SET catalog_status='ARCHIVED' WHERE catalog_status='RELEASED' AND release_date<'2025-01-01';
UPDATE movies SET audience_rating=12.0 WHERE movie_code='MOV24005';

SELECT * FROM movies WHERE catalog_status='ARCHIVED' AND movie_code='MOV24005';
DELETE FROM movies WHERE catalog_status='ARCHIVED' AND movie_code='MOV24005';

INSERT INTO movies
(movie_code,title,genre,original_language,release_date,duration_minutes,director_name,age_certificate,audience_rating,production_budget,catalog_status)
VALUES
('MOV-TEMP-01','Bahubali','Fictional','Telugu','2026-01-16',132,'S S Rajmouli','PARENTAL_GUIDANCE',9.2,350000000.00,'RELEASED');

SELECT * FROM movies WHERE movie_code='MOV-TEMP-01';
DELETE FROM movies WHERE movie_code='MOV-TEMP-01';

SELECT * FROM movies;
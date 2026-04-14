

-- 1. TABLE CREATION
-- ==========================================
CREATE TABLE plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(50),
    price DECIMAL(5,2)
);
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    plan_id INT,
    sign_up_date DATE,
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
);

CREATE TABLE artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50),
    release_year INT,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50),
    duration INT, -- Duration in seconds
    genre VARCHAR(50),
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE listen_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    song_id INT,
    listen_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);
-- ==========================================
-- 2. DATA POPULATION
-- ==========================================

-- A. PLANS
INSERT INTO plans (plan_name, price) VALUES 
('Free', 0.00), 
('Premium', 9.99), 
('Family', 14.99);

-- B. USERS
INSERT INTO users (name, email, plan_id, sign_up_date) VALUES 
('Alice', 'alice@email.com', 2, '2023-01-10'),
('Bob', 'bob@email.com', 1, '2023-01-12'),
('Charlie', 'charlie@email.com', 2, '2023-01-15'),
('David', 'david@email.com', 3, '2023-01-20'),
('Eve', 'eve@email.com', 1, '2023-02-05'),
('Frank', 'frank@email.com', 2, '2023-02-10'),
('Grace', 'grace@email.com', 2, '2023-02-15'),
('Heidi', 'heidi@email.com', 3, '2023-02-20'),
('Ivan', 'ivan@email.com', 1, '2023-03-01'),
('Judy', 'judy@email.com', 2, '2023-03-05'),
('Kevin', 'kevin@email.com', 1, '2023-03-10'),
('Laura', 'laura@email.com', 3, '2023-03-15'),
('Mike', 'mike@email.com', 2, '2023-04-01'),
('Nina', 'nina@email.com', 1, '2023-04-05'),
('Oscar', 'oscar@email.com', 2, '2023-04-10'),
('Pam', 'pam@email.com', 3, '2023-04-15'),
('Quinn', 'quinn@email.com', 1, '2023-05-01'),
('Rachel', 'rachel@email.com', 2, '2023-05-05'),
('Steve', 'steve@email.com', 2, '2023-05-10'),
('Tina', 'tina@email.com', 3, '2023-05-15'),
('Ursula', 'ursula@email.com', 1, '2023-06-01'),
('Victor', 'victor@email.com', 2, '2023-06-05'),
('Wendy', 'wendy@email.com', 1, '2023-06-10'),
('Xander', 'xander@email.com', 2, '2023-06-15'),
('Yara', 'yara@email.com', 3, '2023-07-01'),
('Zack', 'zack@email.com', 1, '2023-07-05'),
('Aaron', 'aaron@email.com', 2, '2023-07-10'),
('Bella', 'bella@email.com', 2, '2023-07-15'),
('Carl', 'carl@email.com', 3, '2023-08-01'),
('Diana', 'diana@email.com', 1, '2023-08-05');

-- C. ARTISTS
INSERT INTO artists (name, country) VALUES 
('The Midnight', 'USA'), 
('Daft Punk', 'France'), 
('Coldplay', 'UK'), 
('BTS', 'South Korea'),
('Fleetwood Mac', 'UK'),
('The Weeknd', 'Canada'),
('Metallica', 'USA'),
('Bad Bunny', 'Puerto Rico'),
('Adele', 'UK'),
('Queen', 'UK');

-- D. ALBUMS
INSERT INTO albums (title, release_year, artist_id) VALUES 
('Endless Summer', 2016, 1), 
('Discovery', 2001, 2), 
('Parachutes', 2000, 3), 
('Butter', 2021, 4),
('Rumours', 1977, 5),
('After Hours', 2020, 6),
('Master of Puppets', 1986, 7),
('Un Verano Sin Ti', 2022, 8),
('25', 2015, 9),
('A Night at the Opera', 1975, 10),
('Random Access Memories', 2013, 2),
('A Rush of Blood', 2002, 3),
('Map of the Soul', 2020, 4),
('Starboy', 2016, 6),
('Ride the Lightning', 1984, 7),
('YHLQMDLG', 2020, 8),
('21', 2011, 9),
('News of the World', 1977, 10),
('Monsters', 2020, 1),
('Heroes', 2022, 1);

-- E. SONGS (FIXED: Added the 30th song so IDs match!)
INSERT INTO songs (title, duration, genre, album_id) VALUES 
-- The Midnight (1,2,3)
('Sunset', 240, 'Synthwave', 1), ('Vampires', 280, 'Synthwave', 1), ('America 2', 260, 'Synthwave', 19),
-- Daft Punk (4,5,6)
('One More Time', 312, 'Electronic', 2), ('Aerodynamic', 207, 'Electronic', 2), ('Get Lucky', 368, 'Electronic', 11),
-- Coldplay (7,8,9)
('Yellow', 269, 'Rock', 3), ('The Scientist', 309, 'Rock', 12), ('Clocks', 307, 'Rock', 12),
-- BTS (10,11,12)
('Butter', 164, 'Pop', 4), ('Dynamite', 199, 'Pop', 4), ('On', 246, 'K-Pop', 13),
-- Fleetwood Mac (13,14)
('Dreams', 257, 'Rock', 5), ('The Chain', 268, 'Rock', 5),
-- The Weeknd (15,16,17)
('Blinding Lights', 200, 'Pop', 6), ('Starboy', 230, 'Pop', 14), ('Save Your Tears', 215, 'Pop', 6),
-- Metallica (18,19,20)
('Master of Puppets', 515, 'Metal', 7), ('Enter Sandman', 331, 'Metal', 7), ('Fade to Black', 417, 'Metal', 15),
-- Bad Bunny (21,22,23)
('Moscow Mule', 245, 'Reggaeton', 8), ('Tití Me Preguntó', 243, 'Reggaeton', 8), ('Safaera', 295, 'Reggaeton', 16),
-- Adele (24,25,26)
('Hello', 295, 'Pop', 9), ('Someone Like You', 285, 'Pop', 17), ('Rolling in the Deep', 228, 'Pop', 17),
-- Queen (27,28,29, 30!!) <-- The Fix
('Bohemian Rhapsody', 354, 'Rock', 10), ('We Will Rock You', 121, 'Rock', 18), ('Radio Ga Ga', 348, 'Rock', 18), ('Don\'t Stop Me Now', 209, 'Rock', 18);

-- F. LISTEN HISTORY (This will now work because ID 30 exists!)
INSERT INTO listen_history (user_id, song_id, listen_date) VALUES 
-- Alice (User 1) loves Synthwave and Rock
(1, 1, '2023-10-01 08:30:00'), (1, 2, '2023-10-01 09:00:00'), (1, 3, '2023-10-02 10:00:00'), (1, 28, '2023-10-02 11:00:00'),
(1, 1, '2023-10-03 08:30:00'), (1, 29, '2023-10-04 14:00:00'), (1, 30, '2023-10-05 18:00:00'), (1, 1, '2023-10-06 09:00:00'),

-- Charlie (User 3) loves Pop and The Weeknd
(3, 16, '2023-10-01 12:00:00'), (3, 16, '2023-10-01 12:05:00'), (3, 16, '2023-10-01 12:10:00'), 
(3, 17, '2023-10-02 15:00:00'), (3, 18, '2023-10-03 16:00:00'), (3, 25, '2023-10-04 10:00:00'), (3, 26, '2023-10-05 11:00:00'),

-- Daft Punk Fans
(2, 4, '2023-10-02 13:00:00'), (2, 5, '2023-10-02 13:05:00'), (2, 6, '2023-10-02 13:10:00'),
(6, 4, '2023-10-03 14:00:00'), (6, 6, '2023-10-03 14:10:00'),
(9, 6, '2023-10-04 09:00:00'), (9, 6, '2023-10-04 09:05:00'),

-- The Metalheads
(15, 19, '2023-10-05 20:00:00'), (15, 20, '2023-10-05 20:10:00'), (15, 21, '2023-10-05 20:20:00'),
(20, 19, '2023-10-06 21:00:00'), (20, 19, '2023-10-06 21:10:00'),

-- The K-Pop Stans
(4, 10, '2023-10-01 07:00:00'), (4, 11, '2023-10-01 07:05:00'), (4, 12, '2023-10-01 07:10:00'),
(8, 10, '2023-10-02 08:00:00'), (8, 10, '2023-10-02 08:05:00'),
(12, 10, '2023-10-03 12:00:00'), (12, 11, '2023-10-03 12:05:00'),

-- Random Listens
(1, 28, '2023-10-07 10:00:00'), (2, 28, '2023-10-07 10:05:00'), (3, 28, '2023-10-07 10:10:00'), (4, 28, '2023-10-07 10:15:00'),
(5, 7, '2023-10-08 14:00:00'), (5, 8, '2023-10-08 14:05:00'),
(7, 13, '2023-10-09 16:00:00'), (7, 14, '2023-10-09 16:10:00'),
(10, 22, '2023-10-10 18:00:00'), (10, 23, '2023-10-10 18:05:00'),
(11, 25, '2023-10-11 11:00:00'), (11, 26, '2023-10-11 11:05:00'),
(13, 1, '2023-10-12 09:00:00'), (13, 2, '2023-10-12 09:05:00'),
(14, 4, '2023-10-13 13:00:00'), (14, 5, '2023-10-13 13:05:00'),
(16, 16, '2023-10-14 15:00:00'), (16, 17, '2023-10-14 15:05:00'),
(17, 28, '2023-10-15 17:00:00'), (17, 29, '2023-10-15 17:10:00'),
(18, 10, '2023-10-16 19:00:00'), (18, 11, '2023-10-16 19:05:00'),
(19, 13, '2023-10-17 21:00:00'), (19, 14, '2023-10-17 21:05:00'),
(21, 19, '2023-10-18 08:00:00'), (21, 20, '2023-10-18 08:05:00'),
(22, 22, '2023-10-19 10:00:00'), (22, 23, '2023-10-19 10:05:00'),
(23, 25, '2023-10-20 12:00:00'), (23, 26, '2023-10-20 12:05:00'),
(24, 1, '2023-10-21 14:00:00'), (24, 2, '2023-10-21 14:05:00'),
(25, 4, '2023-10-22 16:00:00'), (25, 5, '2023-10-22 16:05:00'),
(26, 16, '2023-10-23 18:00:00'), (26, 17, '2023-10-23 18:05:00'),
(27, 28, '2023-10-24 20:00:00'), (27, 29, '2023-10-24 20:05:00'),
(1, 16, '2023-10-25 09:00:00'), (2, 16, '2023-10-25 09:05:00'), (3, 16, '2023-10-25 09:10:00'), 
(30, 16, '2023-10-25 09:15:00'), (29, 16, '2023-10-25 09:20:00'), (28, 16, '2023-10-25 09:25:00');

1. Premium Customers Email List

Business Requirement

The marketing team wants to send a thank-you newsletter to paying customers. Only users on the Premium plan should be included.

Solution

SELECT email
FROM users
WHERE plan_id = 2;

Explanation

The users table contains subscription details.

plan_id = 2 represents the Premium plan.

The query filters only Premium users and returns their email addresses.
 
2. Songs Longer Than 4 Minutes

Business Requirement

To create a “Deep Focus” playlist, we need songs that are longer than 4 minutes.

Solution

SELECT title
FROM songs
WHERE duration > 240;

Explanation

Song duration is stored in seconds.

Four minutes equals 240 seconds.

The query filters songs longer than 240 seconds and returns their titles.

3. Earliest Users (Before March 1, 2023)

Business Requirement

The company wants to reward early adopters who signed up before March 1st, 2023.

Solution

SELECT name, email
FROM users
WHERE sign_up_date < '2023-03-01'
ORDER BY sign_up_date ASC;

Explanation

The WHERE clause filters users who signed up before the given date.

ORDER BY sign_up_date ASC ensures the earliest user appears first.

The query returns names and email addresses for communication.

4. Total Number of Artists

Business Requirement

Management wants to know how many unique artists are available on the platform.

Solution

SELECT COUNT(DISTINCT artist_id) AS total_artists
FROM artists;

Explanation

Each artist has a unique artist_id.

COUNT(DISTINCT) ensures each artist is counted only once.

5. Number of Songs per Genre

Business Requirement

The content team wants to identify which music genres have the most songs.

Solution

SELECT genre, COUNT(song_id) AS song_count
FROM songs
GROUP BY genre
ORDER BY song_count DESC;

Explanation

Songs are grouped by genre.

The number of songs in each genre is counted.

Results are ordered from the most common genre to the least.

6. Average Song Duration

Business Requirement

The tech team wants to know the average song length for storage and streaming optimization.

Solution

SELECT AVG(duration) AS average_duration
FROM songs;

Explanation

The AVG() function calculates the average duration of all songs.

The result is returned in seconds.

7. Artist with the Most Albums

Business Requirement

We need to find which artist has released the most albums in the database.

Solution

SELECT a.name, COUNT(al.album_id) AS album_count
FROM artists a
JOIN albums al ON a.artist_id = al.artist_id
GROUP BY a.name
ORDER BY album_count DESC
LIMIT 1;

Explanation

Artists and albums tables are joined using artist_id.

Albums are counted for each artist.

The artist with the highest album count is selected.

8. Recent Listening Activity Feed

Business Requirement

The product team wants to display a “Recent Activity” feed showing what users listened to and when.

Solution

SELECT u.name, s.title, l.listen_date
FROM users u
JOIN listen_history l ON u.user_id = l.user_id
JOIN songs s ON l.song_id = s.song_id
ORDER BY l.listen_date DESC;

Explanation

The query joins users, listening history, and songs.

It retrieves the user name, song title, and listening time.

Results are sorted so the most recent activity appears first.

CTE (Common Table Expression) Examples

9. Big Sales Records

Requirement

Identify sales where the amount is greater than or equal to 5.

Solution

WITH BigSales AS (
    SELECT *
    FROM sales
    WHERE amount >= 5
)
SELECT * FROM BigSales;

Explanation

A CTE creates a temporary result set.

It improves readability and simplifies filtering logic.

10. Total Sales per Day

Requirement

Calculate total sales per day and show only high-performing days.

Solution

WITH TotalSales AS (
    SELECT day, SUM(amount) AS total_money
    FROM sales
    GROUP BY day
)
SELECT day, total_money
FROM TotalSales
WHERE total_money > 15;

Explanation

Sales are grouped by day.

Total sales per day are calculated.

Only days with high total sales are returned.

11. Lemonade Sales Only

Requirement

Analyze sales data specifically for Lemonade.

Solution

WITH JustLemonade AS (
    SELECT *
    FROM sales
    WHERE item = 'Lemonade'
)
SELECT * FROM JustLemonade;

Explanation

The CTE filters only Lemonade sales.

The result can be reused for further analysis.

DDL Operations (Table Structure Management)

Add a New Column

ALTER TABLE toys ADD color VARCHAR(10);

Adds a new column to an existing table.

Rename a Column

ALTER TABLE toys RENAME COLUMN price TO cost;

Renames an existing column.

Change Column Data Type

ALTER TABLE toys MODIFY toy_name VARCHAR(100);

Changes the data type or size of a column.

Remove All Data

TRUNCATE TABLE toys;

Deletes all rows quickly without removing the table structure.

Delete the Table

DROP TABLE Shippings;

Completely removes the table from the database.




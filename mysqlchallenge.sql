CREATE DATABASE mysqlchallenge;

USE mysqlchallenge;

-- VERY EASY
-- Create a table with your top three cars and include make, model, year.
CREATE TABLE cars (
 	Id INT NOT NULL AUTO_INCREMENT,
    Year INT,
    Make VARCHAR(100),
    Model VARCHAR(100),
    Trim VARCHAR(100),
    PRIMARY KEY(Id)
);
-- Create a query to add in two more cars
INSERT INTO cars
 	(Year, Make, Model, Trim)
VALUES
	(2018, 'Honda','CRV', 'EX'),
    (2020, 'Toyota','Corolla', 'SE'),
    (2022, 'Kia','Sorento', 'SX')
;

-- EASY
-- Create a table with your top five favorite books with Title, Publish Date, and Author First/Last Name 
CREATE TABLE books (
 	Id INT NOT NULL AUTO_INCREMENT,
 	Title VARCHAR(100),
    Publish_date DATE,
    Author_First VARCHAR(80),
    Author_Last VARCHAR(80),
    PRIMARY KEY(Id)
);
-- Create a query to add in two new books Remove the oldest book Provide an additional query giving the sum of all books
INSERT INTO books
 	(Title, Publish_date, Author_First, Author_Last)
VALUES
 	('Harry Potter and the Sorcerers Stone', '1997-06-26', 'Joanne', 'Rowling'),
    ('Charlie and the Chocolate Factory', '1964-01-17', 'Roald', 'Dahl'),
   ('Da Vinci Code', '2003-03-18', 'Dan', 'Brown')
;
    
-- MEDIUM
-- Create a table with your top 10 movies. Include title, release date, and rating
CREATE TABLE movies(
	Id INT AUTO_INCREMENT NOT NULL,
	Title VARCHAR(80),
	ReleaseDate DATE,
	Rating FLOAT,
	PRIMARY KEY (Id)
);
INSERT INTO movies(
 	Title, ReleaseDate, Rating)
VALUES
    ('Toy Story', '1995-11-2', '8.3'),
    ('The Matrix', '1999-03-31', '8.7'),
    ('The Dark Knight Rises', '2012-07-20', '8.4'),
    ('The Dark Knight', '2008-07-18', '9.1'),
    ('Forrest Gump', '1994-06-14', '8.8'),
    ('The Godfather', '1972-03-24', '9.2'),
    ('Inception', '2010-07-16', '8.8'),
    ('The Shawshank Redemption', '1994-10-14', '9.3'),
    ('Joker', '2019-10-04', '8.4'),
    ('The Batman', '2022-03-04', '8.5')
;
-- Create a query that pulls all movies, in order of release date, where the title includes the letter “s”.
SELECT * FROM movies
WHERE Title LIKE ("%s%")
ORDER BY Rating ASC;

-- HARD
-- Make a copy of your Medium Challenge 
CREATE TABLE movies2(
	Id INT AUTO_INCREMENT NOT NULL,
	Title VARCHAR(80),
	ReleaseDate DATE,
	Rating FLOAT,
	PRIMARY KEY (Id)
);
-- Write out the queries that would add the director’s First Name and Last Name into two separate columns.
ALTER TABLE movies2
ADD Director_First VARCHAR(80),
ADD Director_Last VARCHAR(80);

INSERT INTO movies2(
 	Title, ReleaseDate, Rating, Director_First, Director_Last)
VALUES
    ('Toy Story', '1995-11-2', '8.3', 'John', 'Lasseter'),
    ('The Matrix', '1999-03-31', '8.7', 'Lana', 'Wachowski'),
    ('The Dark Knight Rises', '2012-07-20', '8.4', 'Christopher', 'Nolan'),
    ('The Dark Knight', '2008-07-18', '9.1', 'Christopher', 'Nolan'),
    ('Forrest Gump', '1994-06-14', '8.8', 'Robert', 'Zemeckis'),
    ('The Godfather', '1972-03-24', '9.2', 'Francis Ford', 'Coppola'),
    ('Inception', '2010-07-16', '8.8', 'Christopher', 'Nolan'),
    ('The Shawshank Redemption', '1994-10-14', '9.3', 'Frank', 'Darabont'),
    ('Joker', '2019-10-04', '8.4', 'Todd', 'Phillips'),
    ('The Batman', '2022-03-04', '8.5', 'Matt', 'Reeves')
;
-- Create a query that puts the names together.\
SELECT CONCAT(Director_First, ' ', Director_Last) AS "Full Name",Title, ReleaseDate,Rating FROM movies2;
-- Create a query to put the list in alphabetical order by the last name from A-Z After you order the list,
SELECT * FROM movies2
ORDER BY Director_Last ASC;
-- remove the Movies where the Last Name ends with ”R-Z” 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM movies2 WHERE REGEXP_LIKE (Director_Last, '[r-z]$','i');
-- Write a query where the first three appear
SELECT * FROM movies2 LIMIT 3;

-- VERY HARD
-- Copy the table from your Very Easy Challenge. Write a query to add in three cars at once
CREATE TABLE cars2 (
 	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Year INT,
    Make VARCHAR(100),
    Model VARCHAR(100),
    Trim VARCHAR(100)
);
INSERT INTO cars2
 	(Year, Make, Model, Trim)
VALUES
	(2019, 'Honda','CRV', 'EX-L'),
    (2021, 'Toyota','Corolla', 'LX'),
    (2020, 'Kia','Sportage', 'SX')
;
-- Write a query to add in prices and colors for each of these cars
ALTER TABLE cars2
ADD COLUMN Color VARCHAR(20),
ADD COLUMN Price DECIMAL(10,2);

UPDATE cars2
SET Color = "Pearl White", Price = 32876.00
WHERE Id = 1;
UPDATE cars2
SET Color = "Cobalt Blue", Price = 21349.00
WHERE Id = 2;
UPDATE cars2
SET Color = "Black", Price = 29980.00
WHERE Id = 3;
-- Write a query to put the Make and Model together in one column
SELECT CONCAT(Make, ' ', Model) AS "Make and Model", Year, Color, Price FROM cars2;
-- Create a new query that adds an additional column to the results to show how many cars have the same Make.
SELECT Make, COUNT(*)
FROM cars2
GROUP BY Make
HAVING COUNT(*) > 0; -- I did 0 because I only have 1 car for each make

-- Adding cars to test COUNT
INSERT INTO cars2
 	(Year, Make, Model, Trim)
VALUES
	(2010, 'Honda','Accord', 'EX'),
    (2013, 'Honda','Civic', 'LX'),
    (2009, 'Toyota','RAV4', 'Limited')
;

-- Create a new query that adds an additional column to the results to show how many cars have the same Make.
SELECT Make, COUNT(*)
FROM cars2
GROUP BY Make
HAVING COUNT(*) > 1;
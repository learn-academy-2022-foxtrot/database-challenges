-- What is the population of the US? (HINT: 278357000)
SELECT name, population
FROM country 
WHERE name = 'United States'


-- What is the area of the US? (HINT: 9.36352e+06)
SELECT name, surfacearea
FROM country
WHERE name = 'United States'


-- Which countries gained their independence before 1963?
SELECT name, indepyear
FROM country
WHERE indepyear < 1963

-- List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)
SELECT name, population, lifeexpectancy, continent
FROM country
WHERE continent = 'Africa' 
AND population < 3e+7
AND lifeexpectancy > 45

-- Which countries are something like a republic? (HINT: Are there 122 or 143?)
SELECT name, governmentform
FROM country
WHERE governmentform IN ('Republic')

-- Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)
SELECT name, governmentform,indepyear
FROM country
WHERE indepyear > 1945 
AND governmentform LIKE '%Republic'

-- Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)
SELECT name, governmentform,indepyear
FROM country
WHERE indepyear > 1945 
AND NOT governmentform LIKE ('%Republic%')
----------------------------------------------------------------------------
-- ORDER BY
-- I do not use ASC because The ORDER BY keyword sorts the records in ascending order by default.

-- Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)
SELECT name, lifeexpectancy
FROM country 
ORDER BY lifeexpectancy 
LIMIT 15

-- Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)
SELECT name, lifeexpectancy
FROM country 
WHERE lifeexpectancy IS NOT NULL
ORDER BY lifeexpectancy DESC 
LIMIT 15

-- Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)
SELECT *
FROM country
WHERE population != 0
ORDER BY population / surfacearea 
LIMIT 5

-- Which countries have the highest population density?(HINT: starts with Macao) 
-- Result - I got 239 countries. Starts with Macao.

SELECT name 
FROM country
ORDER BY population / surfacearea DESC

-- Which is the smallest country by area? (HINT: .4)
-- I do not use ASC because The ORDER BY keyword sorts the records in ascending order by default.

SELECT *
FROM country
ORDER BY surfacearea

-- Which is the smallest country by population? (HINT: 50)?
-- I do not use ASC because The ORDER BY keyword sorts the records in ascending order by default.
SELECT *
FROM country
WHERE population != 0
ORDER BY population

-- Which is the biggest country by area? (HINT: 1.70754e+07)
SELECT *
FROM country
ORDER BY surfacearea DESC

-- Which is the biggest country by population? (HINT: 1277558000)
SELECT *
FROM country
ORDER BY population DESC

-- Who is the most influential head of state measured by population? (HINT: Jiang Zemin)
SELECT headofstate
FROM country
ORDER BY population DESC
--------------------------------------------------------------------------

-- Subqueries: WITH

-- Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)
WITH top_gnp AS (
	SELECT name, population, gnp
	FROM country
	WHERE population > 0
	ORDER BY gnp DESC
	LIMIT 10
)
SELECT name, population, gnp
FROM top_gnp
ORDER BY population ASC
LIMIT 10

-- Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)

WITH least_populated AS (
		SELECT name, population, surfacearea
		FROM country	
		WHERE population > 0
		ORDER BY population
		LIMIT 10									
		)
SELECT name, population, surfacearea
FROM least_populated
ORDER BY surfacearea DESC
LIMIT 1

------------------------------------------------------------------------------

-- Aggregate Functions: GROUP BY

-- Which region has the highest average gnp? (HINT: North America)
SELECT region, AVG(gnp)
FROM country
GROUP BY region, country.gnp
ORDER BY country.gnp DESC

-- Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)

--This one was the most difficult to me. Every tyme I got Putin 🤪 Finally ELISABETH II 🥳

SELECT headofstate, SUM(surfacearea)
FROM country
GROUP BY headofstate
ORDER BY SUM(surfacearea) DESC

-- What is the average life expectancy for all continents?

SELECT continent, AVG(lifeexpectancy)
FROM country
GROUP BY continent 

-- What are the most common forms of government? (HINT: use count(*))
SELECT governmentform, COUNT(governmentform)
FROM country
GROUP BY governmentform
ORDER BY COUNT(governmentform) DESC;

-- How many countries are in North America?
SELECT region, COUNT(name)
FROM country
WHERE region='North America'
GROUP BY region

-- What is the total population of all continents?
SELECT continent, SUM(population)
FROM country
GROUP BY continent 
Challenges: SQL Country Database
Save your queries in a file if you want to keep them for posterity.

WHERE
What is the population of the US? (HINT: 278357000)

SELECT name, population 
FROM country
WHERE name = 'United States'

Population: 278357000

What is the area of the US? (HINT: 9.36352e+06)

SELECT name, surfacearea
FROM country
WHERE name = 'United States'

Which countries gained their independence before 1963?

SELECT name, indepyear
FROM country
WHERE indepyear <=1963

List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)

SELECT name, continent, lifeexpectancy
FROM country
WHERE continent = 'Africa' 
AND lifeexpectancy > 45
AND population < 30000000

Which countries are something like a republic? (HINT: Are there 122 or 143?)

SELECT name, governmentform
FROM country
WHERE governmentform 
IN ('Republic')

Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)

SELECT name, governmentform, indepyear
FROM country
WHERE governmentform 
IN ('Republic')
AND indepyear > 1945


Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)

SELECT name, governmentform, indepyear
FROM country
WHERE NOT (governmentform LIKE '%Republic%')
AND indepyear > 1945

ORDER BY
Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)

SELECT name, lifeexpectancy
FROM country
WHERE lifeexpectancy IS NOT NULL 
ORDER BY lifeexpectancy ASC 
LIMIT 15;

Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)

SELECT name, lifeexpectancy
FROM country
WHERE lifeexpectancy IS NOT NULL 
ORDER BY lifeexpectancy DESC 
LIMIT 15;

Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)

SELECT name, population, surfacearea,  
population / surfacearea AS density
FROM country 
WHERE population / surfacearea != 0  
ORDER BY density ASC 
LIMIT 5

Which countries have the highest population density?(HINT: starts with Macao)

SELECT name, population, surfacearea,  
population / surfacearea AS density
FROM country 
WHERE population / surfacearea != 0  
ORDER BY density DESC 
LIMIT 5

Which is the smallest country by area? (HINT: .4)

SELECT name, surfacearea
FROM country 
ORDER BY surfacearea ASC 


Which is the smallest country by population? (HINT: 50)?

SELECT name, population
FROM country 
WHERE population !=0
ORDER BY population ASC 

Which is the biggest country by area? (HINT: 1.70754e+07)

SELECT name, surfacearea
FROM country 
WHERE surfacearea !=0
ORDER BY surfacearea DESC

Which is the biggest country by population? (HINT: 1277558000)

SELECT name, population
FROM country 
WHERE population !=0
ORDER BY population DESC

Who is the most influential head of state measured by population? (HINT: Jiang Zemin)

SELECT name, population, headofstate
FROM country 
WHERE population != 0
ORDER BY population DESC


Subqueries: WITH
Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)

WITH top_10_gnp AS (
	SELECT name, population, gnp
	FROM country
	WHERE population > 0
	AND gnp > 0
	ORDER BY gnp DESC
	LIMIT 10
)
SELECT name, population, gnp
FROM top_10_gnp
ORDER BY population ASC
LIMIT 10

Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)

WITH least_pop_countries AS (
	SELECT name, population, surfacearea
	FROM country
	WHERE population > 0
	AND surfacearea > 0
	ORDER BY population ASC
	LIMIT 10
)
SELECT name, population, surfacearea
FROM least_pop_countries
ORDER BY surfacearea DESC
LIMIT 10


Aggregate Functions: GROUP BY
Which region has the highest average gnp? (HINT: North America)

SELECT region, AVG(gnp)
FROM country
WHERE gnp > 0
GROUP BY region
ORDER BY AVG(gnp) DESC


Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)

SELECT headofstate, SUM(surfacearea)
FROM country
WHERE population > 0
GROUP BY headofstate
ORDER BY SUM(surfacearea) DESC


What is the average life expectancy for all continents?

SELECT AVG(lifeexpectancy)
FROM country


What are the most common forms of government? (HINT: use count(*))

SELECT governmentform, COUNT(governmentform) AS total
FROM country
GROUP BY governmentform
ORDER BY total DESC


How many countries are in North America?

SELECT region, COUNT(name)
FROM country
WHERE region = 'North America'
GROUP BY region
ORDER BY COUNT(name) DESC

5


What is the total population of all continents?

SELECT SUM(population)
FROM country

total poplulation is: 6,078,749,450

Stretch Challenges
Which countries have the letter ‘z’ in the name? How many?





Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
Of the smallest 10 countries by population, which has the biggest per capita gnp?
Of the biggest 10 countries by area, which has the biggest gnp?
Of the biggest 10 countries by population, which has the biggest per capita gnp?
What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
What year is this country database from? Cross reference various pieces of information to determine the age of this database.
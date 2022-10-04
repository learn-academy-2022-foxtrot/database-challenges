
WHERE
What is the population of the US? (HINT: 278357000)
```sql
SELECT population, name 
FROM country
WHERE name = 'United States'
```

What is the area of the US? (HINT: 9.36352e+06)
```sql
SELECT surfacearea, name
FROM country
WHERE name = 'United States'
```

Which countries gained their independence before 1963?
```sql
SELECT *, name
FROM country
WHERE indepyear < 1963
```

List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? 
(HINT: 37 entries)
```sql
SELECT *, name
FROM country
WHERE population < 30000000
AND continent = 'Africa'
AND lifeexpectancy > 45

```

Which countries are something like a republic? (HINT: Are there 122 or 143?)
143 countries

```sql
SELECT *, name
FROM country
WHERE governmentform LIKE '%Republic'

```

Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)
```sql
SELECT *, name
FROM country
WHERE governmentform LIKE '%Republic'
AND indepyear > 1945

```
Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)
ORDER BY
```sql
SELECT *, name
FROM country
WHERE NOT (governmentform LIKE '%Republic')
AND indepyear > 1945

```

Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)
"Zambia"
"Mozambique"
"Malawi"
"Zimbabwe"
"Angola"
"Botswana"
"Rwanda"
"Swaziland"
"Niger"
"Namibia"
"Uganda"
"Central African Republic"
"Cï¿½te dï¿½Ivoire"
"Ethiopia"
"Sierra Leone"

```sql
SELECT *, name
FROM country
WHERE lifeexpectancy IS NOT null
ORDER BY lifeexpectancy ASC
LIMIT 15
```

Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)
Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)
"Andorra"
"Macao"
"San Marino"
"Japan"
"Singapore"
"Australia"
"Switzerland"
"Sweden"
"Hong Kong"
"Canada"
"Iceland"
"Gibraltar"
"Italy"
"Cayman Islands"
"Spain"

```sql
SELECT *, name
FROM country
WHERE lifeexpectancy IS NOT null
ORDER BY lifeexpectancy DESC
LIMIT 15
```
Which countries have the highest population density?(HINT: starts with Macao)
"Macao"
"Monaco"
"Hong Kong"
"Singapore"
"Gibraltar"
"Holy See (Vatican City State)"
"Bermuda"
"Malta"
"Maldives"
"Bangladesh"

```sql
SELECT *, name
FROM country
ORDER BY  population / surfacearea DESC
LIMIT 10
```
Which is the smallest country by area? (HINT: .4)
Holy See (Vatican City State)

```sql
SELECT *, name
FROM country
ORDER BY  surfacearea ASC
LIMIT 10
```

Which is the smallest country by population? (HINT: 50)?
"Pitcairn"
```sql
SELECT *, name
FROM country
ORDER BY  population ASC
LIMIT 10

```

Which is the biggest country by area? (HINT: 1.70754e+07)
"Russian Federation"
```sql
SELECT *, name
FROM country
ORDER BY  surfacearea DESC
LIMIT 10
```

Which is the biggest country by population? (HINT: 1277558000)
"China"

```sql
SELECT *, name
FROM country
ORDER BY  population DESC
LIMIT 10
```
Who is the most influential head of state measured by population? (HINT: Jiang Zemin)

"Jiang Zemin"

```sql
SELECT headofstate
FROM country
ORDER BY  population DESC
LIMIT 10
```

Subqueries: WITH
Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)
```sql
WITH populated_countries AS (
	SELECT name, population, gnp
	FROM country
	WHERE population > 0
	ORDER BY gnp DESC
	LIMIT 10
	)
SELECT name, population, gnp
FROM populated_countries
ORDER BY population ASC
LIMIT 10;
```

Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)
"Svalbard and Jan Mayen"
```sql
WITH populated_countries AS (
	SELECT name, population, surfacearea
	FROM country
	WHERE population > 0
	ORDER BY population ASC
	LIMIT 10
	)
SELECT name, population, surfacearea
FROM populated_countries
ORDER BY surfacearea DESC
LIMIT 10;
```

Aggregate Functions: GROUP BY
Which region has the highest average gnp? (HINT: North America)
```sql 
SELECT region, AVG(gnp)
FROM country
GROUP BY region, country.gnp
ORDER BY country.gnp DESC
```

Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)
--work in progress--
```sql
WITH populated_countries AS (
	SELECT name, population, surfacearea
	FROM country
	WHERE population > 0
	ORDER BY population DESC
	LIMIT 10
	)
SELECT name, population, surfacearea
FROM populated_countries
ORDER BY surfacearea ASC
LIMIT 10;
```
What is the average life expectancy for all continents?
What are the most common forms of government? (HINT: use count(*))
How many countries are in North America?
What is the total population of all continents?
Stretch Challenges
Which countries have the letter ‘z’ in the name? How many?
Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
Of the smallest 10 countries by population, which has the biggest per capita gnp?
Of the biggest 10 countries by area, which has the biggest gnp?
Of the biggest 10 countries by population, which has the biggest per capita gnp?
What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
What year is this country database from? Cross reference various pieces of information to determine the age of this database.

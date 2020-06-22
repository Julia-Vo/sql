SELECT * 
FROM countries;

-- # of African countries 
SELECT COUNT(*)
AS "African Countries"
FROM countries
WHERE continent = 'Africa';

-- pop of Oceania in 2005
SELECT SUM(population_years.population)
AS "2005 Pop of Oceania"
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE population_years.year = '2005'
AND countries.continent = 'Oceania';

-- Avg pop of South America countries, 2003
SELECT continent, year, AVG(population) AS "AVG Pop"
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE countries.continent = 'South America'
AND population_years.year = '2003';

-- Country with the smallest pop, 2007
SELECT name, population, year
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE year = '2007'
AND population IS NOT NULL
ORDER BY population
LIMIT 1;

-- Avg. pop of Poland, all years in dataset
SELECT name, AVG(population) AS "Avg. Pop in Data"
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE name = 'Poland';

-- # of countries countaining "The" in their name
Select COUNT(DISTINCT name) AS "# of Countries with The:"
FROM countries
WHERE name LIKE '%The%';

-- Pop of each continent in 2010

SELECT continent, SUM(population) AS "2010 Pop"
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE year = '2010'
GROUP BY 1
ORDER BY 2 DESC;

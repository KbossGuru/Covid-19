SELECT *
FROM dbo.worldometer_data;

-- delete all the columns except the Country Region, population, continent and total cases
ALTER TABLE dbo.worldometer_data
	DROP COLUMN TotalCases;

ALTER TABLE dbo.worldometer_data
	DROP COLUMN NewCases;

ALTER TABLE dbo.worldometer_data
	DROP COLUMN NewDeaths;

ALTER TABLE dbo.worldometer_data
	DROP COLUMN TotalDeaths;

ALTER TABLE dbo.worldometer_data
	DROP COLUMN TotalRecovered;

ALTER TABLE dbo.worldometer_data
	DROP COLUMN NewRecovered;

ALTER TABLE dbo.worldometer_data
	DROP COLUMN ActiveCases;

ALTER TABLE dbo.worldometer_data
	DROP COLUMN ["Serious];

ALTER TABLE dbo.worldometer_data
	DROP COLUMN [Critical"];

ALTER TABLE dbo.worldometer_data
	DROP COLUMN [Tot Cases 1M pop];

ALTER TABLE dbo.worldometer_data
	DROP COLUMN [Deaths 1M pop];

ALTER TABLE dbo.worldometer_data
	DROP COLUMN [Tests 1M pop];

ALTER TABLE dbo.worldometer_data
	DROP COLUMN [WHO Region];

--alter the data type of the columns 
ALTER TABLE dbo.worldometer_data
	ALTER COLUMN Populations FLOAT;

ALTER TABLE dbo.worldometer_data
	ALTER COLUMN TotalTests FLOAT;

--Tests per continent
SELECT Continent, SUM(TotalTests) AS Tests
FROM dbo.worldometer_data
GROUP BY Continent;

--Population per continent
SELECT Continent, SUM(Populations) as Population
FROM dbo.worldometer_data
GROUP BY Continent;
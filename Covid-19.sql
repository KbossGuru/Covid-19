-- Check the datatype of the columns in country_wise_latest table
SELECT C.NAME AS COLUMN_NAME,
       TYPE_NAME(C.USER_TYPE_ID) AS DATA_TYPE,
       C.IS_NULLABLE,
       C.MAX_LENGTH,
       C.PRECISION,
       C.SCALE
FROM SYS.COLUMNS C
JOIN SYS.TYPES T
     ON C.USER_TYPE_ID=T.USER_TYPE_ID
WHERE C.OBJECT_ID=OBJECT_ID('dbo.country_wise_latest');

--change the text inf in column Death-per-100-recovered to 0 in order to fix the datatype
UPDATE dbo.country_wise_latest SET [Deaths-per-100-Recovered]= 0
WHERE [Deaths-per-100-Recovered]= 'inf';

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN [Deaths-per-100-Recovered] FLOAT;

SELECT * FROM dbo.country_wise_latest; 

--Top 10 Countries with the highest number of cases
SELECT [Country(Region)], Confirmed
FROM dbo.country_wise_latest
ORDER BY Confirmed DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;

--Top 10 countries with the highest death rate 
SELECT [Country(Region)], Confirmed, Deaths, ROUND(((CAST(Deaths AS FLOAT)/Confirmed)* 100),3) AS Death_rate 
FROM dbo.country_wise_latest
WHERE Confirmed > 1000
ORDER BY Death_rate DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;

--TOP 10 countries with the highest recoveries
SELECT [Country(Region)], Confirmed, Recovered, ROUND(((CAST(Recovered AS FLOAT)/Confirmed)* 100),3) AS Recovery_rate 
FROM dbo.country_wise_latest
WHERE Confirmed > 1000
ORDER BY Recovery_rate DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;

--Regions with the highest number of cases
SELECT [WHO-Region], SUM(Confirmed) AS total_cases
FROM dbo.country_wise_latest
GROUP BY [WHO-Region]
ORDER BY total_cases DESC;

--Region with the highest death rate 
SELECT [WHO-Region], SUM(Confirmed) AS total_cases, SUM(Deaths) AS total_deaths, ROUND(((CAST(SUM(Deaths) AS FLOAT)/SUM(Confirmed))* 100),3) AS Death_rate 
FROM dbo.country_wise_latest
GROUP BY [WHO-Region]
ORDER BY Death_rate DESC;

--Region with the highest recoveries
SELECT [WHO-Region], SUM(Confirmed) AS total_cases, SUM(Recovered) AS recovered, ROUND(((CAST(SUM(Recovered) AS FLOAT)/SUM(Confirmed))* 100),3) AS Recovery_rate
FROM dbo.country_wise_latest
GROUP BY [WHO-Region]
ORDER BY Recovery_rate DESC;

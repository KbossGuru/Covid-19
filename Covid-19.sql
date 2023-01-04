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

--changing the datatypes of columns
ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN Confirmed INT;

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN Recovered INT;

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN Active INT;

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN Deaths INT;

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN [New cases] INT;

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN [New deaths] INT;

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN [New recovered] INT;

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN [Deaths   100 Cases] FLOAT;

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN [Recovered   100 Cases] FLOAT;

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN [Confirmed last week] INT;

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN [1 week change] INT;

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN [1 week % increase] FLOAT;

--change the text inf in column Death-per-100-recovered to 0 in order to fix the datatype
UPDATE dbo.country_wise_latest SET [Deaths-per-100-Recovered]= 0
WHERE [Deaths-per-100-Recovered]= 'inf';

ALTER TABLE dbo.country_wise_latest
    ALTER COLUMN [Deaths-per-100-Recovered] FLOAT;

--Countries with the highest number of cases
--countries with the highest number of deaths 
--countries with the highest recoveries
--Region with the highest number of cases
--Region with the highest number of deaths 
--Region with the highest recoveries
--Region with the most deaths
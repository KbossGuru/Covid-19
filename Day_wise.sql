SELECT * 
FROM dbo.day_wise;

-- delete redundant columns

ALTER TABLE dbo.day_wise
	DROP COLUMN [Deaths   100 Recovered];

ALTER TABLE dbo.day_wise
	DROP COLUMN [Recovered   100 Cases];

ALTER TABLE dbo.day_wise
	DROP COLUMN [No  of countries];

ALTER TABLE dbo.day_wise
	DROP COLUMN [Deaths   100 Cases];

-- fix the datatypes of the columns 
ALTER TABLE dbo.day_wise
	ALTER COLUMN Confirmed INT;

ALTER TABLE dbo.day_wise
	ALTER COLUMN Deaths INT;

ALTER TABLE dbo.day_wise
	ALTER COLUMN Recovered INT;

ALTER TABLE dbo.day_wise
	ALTER COLUMN Active INT;

ALTER TABLE dbo.day_wise
	ALTER COLUMN [New cases] INT;

ALTER TABLE dbo.day_wise
	ALTER COLUMN [New deaths] INT;

ALTER TABLE dbo.day_wise
	ALTER COLUMN [New recovered] INT;

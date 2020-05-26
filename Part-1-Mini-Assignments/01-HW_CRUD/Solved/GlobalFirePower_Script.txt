-- Drop table if exists
DROP TABLE firepower;

-- Create new table to import data
CREATE TABLE firepower (
	country VARCHAR,
	ISO3 VARCHAR,
	rank INT,
	TotalPopulation INT,
	ManpowerAvailable INT,
	TotalMilitaryPersonnel INT,
	ActivePersonnel INT,
	ReservePersonnel INT,
	TotalAircraftStrength INT,
	FighterAircraft INT,
	AttackAircraft INT,
	TotalHelicopterStrength INT,
	AttackHelicopters INT
);

-- Import data from firepower.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM firepower;

--Find the rows that have a `ReservePersonnel` of 0 and remove these rows from the dataset.
DELETE FROM firepower
WHERE reservepersonnel=0;

--Every country in the world at least deserves one `FighterAircraft`—it only seems fair. 
--Let's add one to each nation that has none.
UPDATE firepower
SET fighteraircraft=1
WHERE fighteraircraft=0;

--check to make sure there are no figteraircraft = 0
SELECT * FROM firepower
WHERE fighteraircraft=0;

--Find the [Averages] for `TotalMilitaryPersonnel`, `TotalAircraftStrength`,
--`TotalHelicopterStrength`, and `TotalPopulation`, and rename the columns with their designated average.
SELECT 
ROUND(AVG(TotalMilitaryPersonnel),2) AS Average_Military_Personnel,
ROUND(AVG(TotalAircraftStrength),2) AS Average_Aircraft_Strength,
ROUND(AVG(TotalHelicopterStrength),2) AS Average_Helicopter_Strength,
ROUND(AVG(TotalPopulation),2) AS Average_Population
FROM firepower;
SELECT * FROM sql_project.fastag;

DELETE FROM sql_project.fastag
WHERE Vehicle_Type = 'Motorcycle';

ALTER TABLE sql_project.fastag
ADD COLUMN time_ VARCHAR(255);

UPDATE sql_project.fastag
SET time_ = substring_index(Timestamp, ' ', -1);

ALTER TABLE sql_project.fastag
DROP COLUMN Timestamp;

ALTER TABLE sql_project.fastag
MODIFY COLUMN time_ TIME; 

ALTER TABLE sql_project.fastag
ADD COLUMN Latitude FLOAT, ADD COLUMN Longitude FLOAT;

UPDATE sql_project.fastag
SET Latitude = SUBSTRING_INDEX(Geographical_Location, ', ', 1), Longitude = SUBSTRING_INDEX(Geographical_Location, ', ', -1);

ALTER TABLE sql_project.fastag
ADD COLUMN State text;

UPDATE sql_project.fastag
SET State = SUBSTRING(Vehicle_Plate_Number, 1, 2);

CREATE TABLE FinalClean AS
SELECT * FROM sql_project.fastag;

SELECT * FROM FinalClean;
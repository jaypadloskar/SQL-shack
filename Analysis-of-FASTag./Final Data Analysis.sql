SELECT * FROM sql_project.fastag;

CREATE TABLE byvehicletypefinal
SELECT Vehicle_type, 
	COUNT(Vehicle_Type) AS Count_by_Vehicle_type,
    ROUND((COUNT(Vehicle_Type) / (SELECT COUNT(*) FROM sql_project.fastag WHERE Fraud_indicator = 'Fraud')),2) * 100 AS Vehicle_Type_Percentage
FROM sql_project.fastag
WHERE Fraud_indicator = 'Fraud'
Group by Vehicle_Type
order by Count_by_Vehicle_type DESC;

SELECT * FROM fastag_fraud.byvehicletypefinal;

CREATE TABLE bytollidbooth AS
SELECT TollBoothID, 
	COUNT(TollBoothID) AS Count_of_TollBoothID,
    ROUND((COUNT(TollBoothID) / (SELECT COUNT(*) FROM sql_project.fastag WHERE Fraud_indicator = 'Fraud')),2) * 100 AS ToothBoothID_Percentage
FROM sql_project.fastag
WHERE Fraud_indicator = 'Fraud'
Group by TollBoothID
order by Count_of_TollBoothID DESC;

SELECT * FROM fastag_fraud.bytollidbooth;

SELECT COUNT(FastagID) FROM sql_project.fastag where Fraud_indicator = 'Fraud';

SELECT round((((SELECT COUNT(FastagID) FROM sql_project.fastag where Fraud_indicator = 'Fraud')/COUNT(FastagID)) * 100),2) AS Percentage_of_Fraud_Fastags
FROM sql_project.fastag;

-- CREATE TABLE ---- AS
SELECT Lane_Type, 
	COUNT(Lane_Type) AS Count_by_Lane_Type,
	round((COUNT(Lane_Type) / (SELECT COUNT(*) FROM sql_project.fastag WHERE Fraud_indicator = 'Fraud')),3) * 100 AS Percentage
FROM sql_project.fastag
WHERE Fraud_indicator = 'Fraud'
Group by Lane_Type
order by Count_by_Lane_Type DESC;

SELECT Vehicle_Dimensions, 
	COUNT(Vehicle_Dimensions) AS Count_by_Vehicle_Dimensions,
	round((COUNT(Vehicle_Dimensions) / (SELECT COUNT(*) FROM sql_project.fastag WHERE Fraud_indicator = 'Fraud')), 3) * 100 AS Percentage
FROM sql_project.fastag
WHERE Fraud_indicator = 'Fraud'
Group by Vehicle_Dimensions
order by Count_by_Vehicle_Dimensions DESC;

SELECT Geographical_Location, 
	COUNT(Geographical_Location) AS Count_by_Geographical_Location,
    round((COUNT(Geographical_Location) / (SELECT COUNT(*) FROM sql_project.fastag WHERE Fraud_indicator = 'Fraud')), 3) * 100 AS Percentage
FROM sql_project.fastag
WHERE Fraud_indicator = 'Fraud'
Group by Geographical_Location
order by Count_by_Geographical_Location DESC;

SELECT state, 
	COUNT(state) AS Count_by_state,
    round((COUNT(Vehicle_Dimensions) / (SELECT COUNT(*) FROM sql_project.fastag WHERE Fraud_indicator = 'Fraud')), 3) * 100 AS Percentage
FROM sql_project.fastag
WHERE Fraud_indicator = 'Fraud'
Group by state
order by Count_by_state DESC;

SELECT
    Fraud_indicator,
    MIN(Vehicle_Speed) AS min_speed_kph,
    MAX(Vehicle_Speed) AS max_speed_kph,
    AVG(Vehicle_Speed) AS avg_speed_kph
FROM
    sql_project.fastag
WHERE
    Fraud_indicator IN ('Fraud', 'Not Fraud')
GROUP BY
    Fraud_indicator;
    
SELECT Fraud_indicator, avg(Transaction_Amount) as avg_transaction_amount,
	avg(Amount_paid)
FROM sql_project.fastag
WHERE Fraud_indicator IN ('Fraud', 'Not Fraud')
GROUP BY Fraud_indicator;

SELECT avg(Transaction_Amount - Amount_paid) as Average_unpaid_amount
FROM sql_project.fastag
WHERE Fraud_indicator = 'Fraud'
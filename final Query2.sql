-- this query includes the creation of the stored procedure, history table, and trigger procedure

-- stored procedure: add a new itinerary
CREATE OR ALTER PROCEDURE NewItinerary
	@itinID INT,
	@userID INT,
	@destName VARCHAR(20),
	@startDate DATE,
	@endDate DATE

AS
	INSERT INTO ITINERARY
	VALUES (@itinID, @userID, @destName, @startDate, @endDate);

-- trigger history: change price on transportation 
CREATE TABLE TRANSPORTATION_COST_HISTORY (
	costId INT PRIMARY KEY IDENTITY(1,1),
    itinID INT,
	priceChangeDate DATE,
    transpType VARCHAR(20),
    transpOldCost DECIMAL(10, 2),
	transpNewCost DECIMAL(10, 2));

CREATE OR ALTER TRIGGER TranspCostHistory
ON TRANSPORTATION
AFTER UPDATE
AS	
	--PRINT 'Trigger Fired';
	INSERT INTO TRANSPORTATION_COST_HISTORY (itinID, priceChangeDate, transpType, transpOldCost, transpNewCost)
	SELECT
		deleted.itinID,
		cast(GETDATE() AS DATE) as priceChangeDate,
		deleted.transpType,
		deleted.transpCost as transpOldCost,
		inserted.transpCost as transpNewCost
	FROM
		DELETED
	INNER JOIN
		INSERTED ON deleted.transpID = inserted.transpID; 
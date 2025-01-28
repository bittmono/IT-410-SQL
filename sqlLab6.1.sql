DROP TABLE IF EXISTS OrdersWithNames

--step 1
CREATE OR ALTER PROCEDURE InsertAgent
	@agentID VARCHAR (10)
	, @agentName VARCHAR (20)
	, @agentCity VARCHAR (20)
	, @agentPerc DECIMAL(5,2)

AS
	INSERT INTO AGENTS
	VALUES (@agentID, @agentName, @agentCity, @agentPerc);

--3 
GO
CREATE OR ALTER PROCEDURE UpdAgentPerc
	@agentId VARCHAR(10)
	, @newAgentPerc DECIMAL(5,2)
AS
	UPDATE AGENTS
	SET Perc = @newAgentPerc
	WHERE AID = @agentID;

--step 5
CREATE TABLE OrdersWithNames
(OrdHistoryID	INT NOT NULL PRIMARY KEY	IDENTITY(1,1),
OrderNumber		VARCHAR(4),
OrderMonth		VARCHAR(3),
CID				VARCHAR(4),
CNAME			VARCHAR(6),
AID				VARCHAR(3),
ANAME			VARCHAR(5),
PID				VARCHAR(3),
PNAME			VARCHAR(6),
QTY				INT,
DOLLARS			DECIMAL(6,2));

--6
CREATE OR ALTER PROCEDURE InsertOrder 
	@_ordno VARCHAR(4),
	@_o_month VARCHAR(3),
	@_cid VARCHAR(4),
	@_aid VARCHAR(3),
	@_pid VARCHAR(3),
	@_qty int,
	@_dollars DECIMAL (6,2)
AS
	INSERT INTO Orders (ordno, o_month, cid, aid, pid, qty, dollars)
    VALUES (@_ordno, @_o_month, @_cid, @_aid, @_pid, @_qty, @_dollars);

--step 8
CREATE TABLE PriceChangeHistory
	(PID VARCHAR(3),
	priceChangeDate DATE,
	oldPrice DECIMAL(3,2),
	newPrice DECIMAL(3,2));

--step 9 
CREATE OR ALTER TRIGGER RecordPriceChange
ON PRODUCTS
AFTER UPDATE

AS
    INSERT INTO PriceChangeHistory(PID, priceChangeDate, oldPrice, newPrice)
    SELECT 
        DELETED.PID, 
        CAST(GETDATE() AS DATE) AS priceChangeDate, 
        DELETED.PRICE AS oldPrice, 
        INSERTED.PRICE AS newPrice
    FROM 
        DELETED
    INNER JOIN 
        INSERTED ON DELETED.PID = INSERTED.PID;

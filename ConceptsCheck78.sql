/*
QUESTION 1: name all six clauses
	select: column filter
	from: row filter
	where: filter by conditional
	group by: organized by attribute (columns?)
	having: organized by attribute (rows?)
	order by: in order by attribute
QUESTION 2: stored procedure
	stored procedure is a built command that processes requests manually from the user. 
	this allows certain actions, like adding a new user or updating specific information, to 
	be automated by only inputting the needed info (without writing the whole script)
QUESTION 3: triggers
	triggers are commands that are activated based off meeting certain requirements.
	these are useful for keeping a history record of changes and overall tracking, and are only
	activated AFTER the command takes place
*/

-- QUESTION 4
SELECT *
FROM CUSTOMER

--QUESTION 5
SELECT *
FROM CUSTOMER
WHERE CUS_BALANCE > 0
ORDER BY CUS_BALANCE DESC

--QUESTION 6
SELECT P_CODE AS PRODCODE, P_DESCRIPT AS PRODDESC
FROM PRODUCT
WHERE V_CODE = 21344 AND
	P_PRICE > 15;

--QUESTION 7
SELECT AVG(P_PRICE) AS AVERAGE_PRICE
FROM PRODUCT
WHERE V_CODE = 25595; 

--testing
SELECT *
FROM PRODUCT
WHERE V_CODE = 25595; 

--QUESTION 8
SELECT INV_NUMBER AS INVOICE_NUMBER, SUM(LINE_PRICE) AS LINE_TOTAL
FROM LINE
GROUP BY INV_NUMBER

--testing
SELECT *
FROM LINE 

--QUESTION 9
-- im assuming that the two tables required are product and vendor 
-- (vendor being where we pull vendor name from)
-- ill most likely need a join statement, unfortunately i dont
-- remember which join statement i need
SELECT P_CODE, P_DESCRIPT, P_QOH
FROM PRODUCT 
FULL JOIN VENDOR --most likely incorrect
	ON PRODUCT.V_CODE = VENDOR.V_NAME
WHERE P_QOH < 30;

--testing
SELECT *
FROM VENDOR


--QUESTION 10
-- im completely loss on how to do this so i tried to
-- break down the thought process of it
SELECT CUS_CODE, COUNT(INV_NUMBER) AS TOTAL_INVOICES
FROM INVOICE
--WHERE COUNT(INV_NUMBER) > 2 
GROUP BY CUS_CODE

--then there would be a join statement with CUSTOMER table
-- this would be between CUS_LNAME from CUSTOMER table and CUS_CODE from INVOICE table

--testing
SELECT *
FROM INVOICE

SELECT *
FROM LINE
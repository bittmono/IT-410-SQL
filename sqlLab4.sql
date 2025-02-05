	-- step 1
	SELECT PRODUCTS.PID, PRODUCTS.PNAME, ORDERS.ORDNO, ORDERS.O_MONTH, ORDERS.DOLLARS
	FROM PRODUCTS JOIN ORDERS ON PRODUCTS.PID = ORDERS.PID
	ORDER BY PRODUCTS.PID ASC; 

--step 2 
SELECT PRODUCTS.PID, PRODUCTS.PNAME, ORDERS.ORDNO, ORDERS.O_MONTH, ORDERS.DOLLARS
FROM PRODUCTS LEFT OUTER JOIN ORDERS ON PRODUCTS.PID = ORDERS.PID
ORDER BY ORDERS.ORDNO ASC;

--step 3
SELECT O.ORDNO, O.DOLLARS, A.AID, A.ANAME
FROM ORDERS O RIGHT OUTER JOIN AGENTS A ON O.AID = A.AID
ORDER BY O.DOLLARS ASC;




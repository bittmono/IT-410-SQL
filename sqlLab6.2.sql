SELECT *
FROM ORDERS

SELECT *
FROM OrdersWithNames

--step 3
EXEC InsertAgent
	@agentId = 'A15'
	, @agentName = 'HENRY'
	, @agentCity = 'MIAMI'
	, @agentPerc = 2;  

--step 4 
EXEC UpdAgentPerc 
	@agentId = 'A15'
	, @newAgentPerc = 4;

--step 7 pt 1
EXEC InsertOrder
	@_ordno = '2500',
	@_o_month = 'MAY',
	@_cid = 'C002',
	@_aid = 'A02',
	@_pid = 'P05',
	@_qty = 200,
	@_dollars = 700.00;

--step 10
select * from products where pid = 'P09'

UPDATE PRODUCTS
set price = 3.00
	where pid = 'P09'

select * from products where pid = 'P09'

select * from PriceChangeHistory
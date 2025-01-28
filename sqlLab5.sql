select * 
from orders

-- 1
select PID, PNAME
from products
where quantity > 120000

--2
select ordno
from orders
where O_MONTH in ('Jan')

--3
select ordno, o_month, qty, dollars
from orders
where CID = 'C001'
  AND dollars > 500
order by o_month;

-- 4
select avg(qty) as AvgQty, avg(dollars) as AvgAmt
from orders

--5
select sum(dollars) as TotalAmt
from orders
where AID = 'A05'
group by AID

-- 6
select o_month
	, count(distinct cid) as TotCust
	, count(ordno) as TotOrd
	, sum(dollars) as TotDollar
	, avg(dollars) as AvgDollar
	, max(dollars) as MaxDollar
	, min(dollars) as MinDollar
from orders
group by o_month
order by o_month asc; 

--7
select cid
	, count(ordno) as TotOrd
	, count(distinct pid) as TotProducts
	, sum(dollars) as TotDollar
	, avg(dollars) as AvgDollar
from orders
group by cid
order by TotDollar desc;

--8
select products.pname AS ProdName, 
       SUM(orders.qty) AS TotQty
from orders
join products 
  on orders.PID = products.PID
group by products.pname
HAVING COUNT(DISTINCT orders.CID) > 1; 

--9
select ordno AS OrderNumber, 
       cname AS CustomerName, 
       aname AS AgentName, 
       pname AS ProductName, 
       qty AS QuantityOrdered, 
       dollars AS InvoiceAmount
from orders 
JOIN customers on orders.cid = customers.cid 
JOIN agents on orders.aid = agents.aid
JOIN products on orders.pid = products.pid
where o_month = 'MAR'
order by dollars DESC;

--10
select cname as CustName
from orders
join customers on orders.cid = customers.cid
join products on orders.pid = products.pid
join agents on orders.aid = agents.aid
where products.pname = 'pencil'
	and agents.aname in ('Brown', 'Gray')

--HAVING COUNT(ORDNO) >= 2;
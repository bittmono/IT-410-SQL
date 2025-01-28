--this query includes all the tests for 'final Query2'

--test
select * from i_user
select * from itinerary
select * from point_of_interest
select * from accommodation
select * from transportation

--insert into queries (2);
--inserts a new user and a new transportation method onto an existing itinerary
insert into i_user (userID, userEmail, userPass)
values (5, 'exampleuser@example.com', 'password123');

insert into transportation (transpID, itinID, poiID, transpType, transpCost)
values (405, 102, 202, 'Bus', 9.00)

	--test
select * from transportation

select * from transportation where transpType = 'Bus';




--stored procedure: (located in final Query2)
--add a new itinerary with an existing user

exec NewItinerary '105','003','Singapore','2024-03-12','2024-04-01';

	--test
select *
from ITINERARY
	WHERE userID = 003;

select * from itinerary




--trigger: (table and trigger located in final Query2)
--change price on transportation 
select * from transportation where transpID = 402;

UPDATE TRANSPORTATION
set transpCost = 25.00
	where transpID = 402;

select * from transportation where transpID = 402;

SELECT * FROM TRANSPORTATION_COST_HISTORY;

--business query
--for itinerary id 102, provide the transportation and their costs for each itinerary and sorted in descending order
select 
	t.transpType AS transportationType,
    t.transpCost AS cost,
    i.itinID AS itineraryID,
    i.destName AS destination
from
	TRANSPORTATION t
inner join
	ITINERARY i ON t.itinID = i.itinID
where 
    i.itinID = 102 
order by
    t.transpCost DESC;
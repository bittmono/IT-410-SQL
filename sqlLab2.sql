--step 1
CREATE TABLE OWNER (
	ownerID decimal (12) PRIMARY KEY,
	firstName varchar (100),
	petID decimal(12)
	);

--step 2
CREATE TABLE PET(
	petId decimal (12) PRIMARY KEY,
	petType varchar(100),
	petName varchar(100)
	);

--step 3
ALTER TABLE OWNER
	ADD CONSTRAINT FK_OWNER_PET FOREIGN KEY (petID)
			REFERENCES PET (petID);

--step 4 + 5
INSERT INTO PET VALUES (1001, 'Cat', 'Olive'); 
INSERT INTO OWNER VALUES (10, 'John','1001');

--step 6+7, purposefully fails due to FK
INSERT INTO OWNER VALUES (10, 'Mary','1001');
INSERT INTO OWNER VALUES (20, 'Mary','1002'); 

--step 8
INSERT INTO PET VALUES (1002, 'Dog', 'Maggie'); 
INSERT INTO OWNER VALUES (20, 'Mary','1002');

--step 9
SELECT ownerID, firstName
FROM OWNER;

--step 10
SELECT petID AS PetNumber, petName AS PetName
FROM PET
WHERE petType = 'Cat';
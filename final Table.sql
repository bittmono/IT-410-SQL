--drop tables
DROP TABLE IF EXISTS TRANSPORTATION_COST_HISTORY; --creation is located in final Query2
DROP TABLE IF EXISTS TRANSPORTATION;
DROP TABLE IF EXISTS ACCOMMODATION;
DROP TABLE IF EXISTS POINT_OF_INTEREST;
DROP TABLE IF EXISTS ITINERARY;
DROP TABLE IF EXISTS I_USER;

-- user table
CREATE TABLE I_USER 
	(userID INT PRIMARY KEY, 
	userEmail VARCHAR(100) UNIQUE NOT NULL,
    userPass VARCHAR(100) NOT NULL);

-- itinerary table
CREATE TABLE ITINERARY 
	(itinID INT PRIMARY KEY, 
    userID INT NOT NULL,
    destName VARCHAR(20) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    CONSTRAINT FK_userID FOREIGN KEY (userID) REFERENCES I_USER(userID));

-- point of interest table
CREATE TABLE POINT_OF_INTEREST (
    poiID INT PRIMARY KEY,
    itinID INT NOT NULL,
    poiName VARCHAR(20) NOT NULL,
    poiCategory VARCHAR(20) NOT NULL,
    poiLocation VARCHAR(20),
    CONSTRAINT FK_itinID_POI FOREIGN KEY (itinID) REFERENCES ITINERARY(itinID));

-- accomodation table
CREATE TABLE ACCOMMODATION (
    accmID INT PRIMARY KEY,
    itinID INT NOT NULL,
    accmLocation VARCHAR(20),
    inDate DATE NOT NULL,
    outDate DATE NOT NULL,
    CONSTRAINT FK_itinID_ACC FOREIGN KEY (itinID) REFERENCES ITINERARY(itinID));

-- transportation table
CREATE TABLE TRANSPORTATION (
    transpID INT PRIMARY KEY,
    itinID INT NOT NULL,
    poiID INT NOT NULL,
    transpType VARCHAR(20) NOT NULL,
    transpCost DECIMAL(10, 2),
    CONSTRAINT FK_itinID_TRNS FOREIGN KEY (itinID) REFERENCES ITINERARY(itinID),
    CONSTRAINT FK_poiID FOREIGN KEY (poiID) REFERENCES POINT_OF_INTEREST(poiID));

INSERT INTO I_USER VALUES(001,'amychiem@icloud.com','hSi491f0');
INSERT INTO I_USER VALUES(002,'cheeseandwine@gmail.com', 'cheese12345');
INSERT INTO I_USER VALUES(003,'johnapple@yahoo.com', '23ah3efjg');
INSERT INTO I_USER VALUES(004,'maryann98@gmail.com','suu42o9cv');

INSERT INTO ITINERARY VALUES (101, 001, 'Paris', '2024-06-01', '2024-06-10');
INSERT INTO ITINERARY VALUES (102, 002, 'Tokyo', '2024-07-15', '2024-07-25');
INSERT INTO ITINERARY VALUES (103, 003, 'New York', '2024-08-05', '2024-08-15');
INSERT INTO ITINERARY VALUES (104, 004, 'Rome', '2024-09-10', '2024-09-20');

INSERT INTO POINT_OF_INTEREST VALUES (201, 101, 'Eiffel Tower', 'Landmark', 'Champ de Mars');
INSERT INTO POINT_OF_INTEREST VALUES (202, 102, 'Tokyo Tower', 'Landmark', 'Minato');
INSERT INTO POINT_OF_INTEREST VALUES (203, 103, 'Statue of Liberty', 'Landmark', 'Liberty Island');
INSERT INTO POINT_OF_INTEREST VALUES (204, 104, 'Colosseum', 'Landmark', 'Piazza del Colosseo');

INSERT INTO ACCOMMODATION VALUES (301, 101, 'Le Meurice', '2024-06-01', '2024-06-10');
INSERT INTO ACCOMMODATION VALUES (302, 102, 'Hotel New Otani', '2024-07-15', '2024-07-25');
INSERT INTO ACCOMMODATION VALUES (303, 103, 'The Plaza Hotel', '2024-08-05', '2024-08-15');
INSERT INTO ACCOMMODATION VALUES (304, 104, 'Hotel Eden', '2024-09-10', '2024-09-20');

INSERT INTO TRANSPORTATION VALUES (401, 101, 201, 'Taxi', 30.00);
INSERT INTO TRANSPORTATION VALUES (402, 102, 202, 'Train', 20.00);
INSERT INTO TRANSPORTATION VALUES (403, 103, 203, 'Ferry', 15.00);
INSERT INTO TRANSPORTATION VALUES (404, 104, 204, 'Bus', 10.00);


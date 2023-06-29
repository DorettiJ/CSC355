/*
    Jon Doretti
    CSC 355 Section 401T Fall 2021
    Assignment 2
    9/24/21
*/
 
-- Dropping the three tables we are creating
DROP TABLE ASSIGNMENT;
DROP TABLE ROUTE;
DROP TABLE TRUCK;

-- Creating the three tables
CREATE TABLE TRUCK(
    TID         CHAR(2),
    Company     CHAR(20),
    TruckYear   NUMBER(4,0)
                DEFAULT 2000
                CHECK (1 <= TruckYear),
    CONSTRAINT PK_TID PRIMARY KEY (TID)
);

CREATE TABLE ROUTE( 
    RID         CHAR(4),
    FromCity    VARCHAR(36),
    ToCity      VARCHAR(36),
    /*
     Length of 36 as the longest city name in the US from Census date is 
     36 characters.
    */
    TruckID     CHAR(2),
    CONSTRAINT FK_ROUTEID FOREIGN KEY (TruckID) REFERENCES TRUCK(TID),
    CONSTRAINT PK_RID PRIMARY KEY (RID)
);

CREATE TABLE ASSIGNMENT(
    RouteID     CHAR(4),
    DriverID    CHAR(6),
    DriverName  VARCHAR(70), 
    /*
    the UK government uses a limit of 70 chars
    https://webarchive.nationalarchives.gov.uk/ukgwa/+/http://www.cabinetoffice.gov.uk/media/254290/GDS%20Catalogue%20Vol%202.pdf
    page 9of 20
    */
    DepartureDate   DATE,
    CONSTRAINT TK_ROUTEID FOREIGN KEY (Routeid) REFERENCES ROUTE(RID),
    PRIMARY KEY (RouteID, DriverID)

);


-- Populating the three tables
insert into TRUCK
    values ('30', 'Fake Company', 1970);
insert into TRUCK
    values ('39','Not Fake Company', 2001);
insert into TRUCK
    values ('70','Amazon Shipping', 2018);

insert into ROUTE
    values ('3425', 'Chicago', 'Village of Grosse Pointe Shores city', '30');
insert into ROUTE
    values ('2345', 'New York', 'Los Angelese', '39');
insert into ROUTE
   values ('6876', 'Oak Lawn', 'New Orleans', '70');
insert into ROUTE
    values ('7899', 'New Orleans', 'Salt Lake City', '70');

insert into ASSIGNMENT
    values ('3425', '123456', 'Jonathon Doretti', to_date('2021-05-06', 'yyyy-mm-dd'));
insert into ASSIGNMENT
    values ('6876', '123457', 'Jack Feldner', to_date('2021-04-09', 'yyyy-mm-dd'));
insert into ASSIGNMENT
    values ('7899', '123456', 'Jonathon Doretti', to_date('2021-04-14', 'yyyy-mm-dd'));
insert into ASSIGNMENT
    values ('2345', '987654', 'Sami Al-Qaudi', to_date('2001-01-19', 'yyyy-mm-dd'));
insert into ASSIGNMENT
    values ('3425', '123457', 'Jack Feldner', to_date('2009-12-16', 'yyyy-mm-dd'));

-- Displaying the three tables
SELECT * FROM ASSIGNMENT;
SELECT * FROM ROUTE;
SELECT * FROM TRUCK;

COMMIT;
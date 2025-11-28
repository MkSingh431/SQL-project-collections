CREATE TABLE Courier_Management_System(
    Shipment_ID INT PRIMARY KEY,
    Sender INT NOT NULL,
    Receiver INT NOT NULL,
    Start_Date DATE,
    Delivery_Date DATE,
    Sender_location VARCHAR(100),
    Receiver_location VARCHAR(100),
    Delivery_Status VARCHAR(50),
    Shipment_Cost DECIMAL(10, 2)
)



INSERT INTO Courier_Management_System (Shipment_ID, Sender, Receiver, Start_Date, Delivery_Date, Sender_location, Receiver_location, Delivery_Status, Shipment_Cost)
VALUES
(101,1,3,'2020-03-14','2020-03-25',"Area1","Area2","Delivered",198),
(102,4,1,'2020-06-18','2020-07-09',"Area2","Area4","Delivered",275),
(103,2,3,'2020-12-01',NULL,"Area5","Area1","In-Transit",200),
(104,1,5,'2020-06-23','2020-06-25',"Area1","Area4","Delivered",314),
(105,3,4,'2020-08-29','2020-09-10',"Area5","Area3","Delivered",275),
(106,5,2,'2020-06-28',NULL,"Area3","Area1","In-Transit",150),
(107,2,4,'2020-07-15','2020-07-20',"Area5","Area3","Delivered",200),
(108,3,1,'2020-09-05','2020-09-15',"Area2","Area1","Delivered",250),
(109,4,5,'2020-10-10',NULL,"Area2","Area4","In-Transit",300),
(110,1,2,'2020-11-01','2020-11-05',"Area1","Area5","Delivered",180);

CREATE TABLE Client(
    Client_ID int PRIMARY KEY,
    Client_Name VARCHAR(100) NOT NULL
)


# modify the Client_ID column to be NOT NULL
ALTER TABLE Client
MODIFY Client_ID INT NOT NULL


ALTER TABLE Courier_Management_System
MODIFY Sender VARCHAR(20),
MODIFY Receiver VARCHAR(20)

INSERT INTO Client (Client_ID, Client_Name)
VALUES
(1,'Phillip'),
(2,'Omega lll'),
(3,'Ramya'),
(4,'Romesh'),
(5,'John')

SELECT *FROM Client;
SELECT *FROM Courier_Management_System;

-- Update the Courier_Management_System table to replace Client_ID with Client_Name for Sender and Receiver
UPDATE courier_management_system cms
JOIN Client c ON cms.Receiver = c.Client_ID
SET cms.Receiver = c.Client_Name;

-- Print all shipment details that are sent by Phillip
SELECT *FROM Courier_Management_System
WHERE Sender = 'Phillip';

-- Print all shipment details that are received by Ramya
SELECT *FROM courier_management_system
where Receiver = 'Ramya';

-- Print all shipments that are in 'In-Transit' status
Select *FROM Courier_Management_System
WHERE Delivery_Status = 'In-Transit';


-- Print all shipments that are delivered within 7 days of the courier Start date
SELECT *FROM Courier_Management_System
WHERE DATEDIFF(Delivery_Date, Start_Date) <= 7 AND Delivery_Status = 'Delivered';


-- Print all shipments that are delivered after 15 days of the courier start date or have not yet been delivered.
SELECT *FROM Courier_Management_System
WHERE (DATEDIFF(Delivery_Date, Start_Date) > 15 OR Delivery_Date IS NULL) AND Delivery_Status = 'In-Transit';

-- Print the shipment details whose shipment cost in the range of 200 to 300

SELECT *FROM Courier_Management_System
WHERE Shipment_Cost BETWEEN 200 AND 300;


-- . Print the name of all senders whose delivery status is ‘in-transit’.

SELECT DISTINCT Sender
FROM Courier_Management_System
WHERE Delivery_Status = 'In-Transit';


-- Print the shipment ID that has the highest shipment cost.
SELECT Shipment_ID
FROM Courier_Management_System
ORDER BY Shipment_Cost DESC
LIMIT 1;


-- Print all the shipment details that are delivered by ‘John’ and received by ‘Omega III’
SELECT *FROM Courier_Management_System
WHERE Sender = 'John' AND Receiver = 'Omega lll';



SELECT *FROM bank
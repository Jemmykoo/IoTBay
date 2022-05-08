/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  Alice
 * Created: 08/05/2022
 */

DROP TABLE USERS;

CREATE TABLE USERS(
ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 100000, INCREMENT BY 1),
EMAIL VARCHAR(255) UNIQUE NOT NULL,
FIRSTNAME VARCHAR (255) NOT NULL,
LASTNAME VARCHAR (255) NOT NULL,
PASSWORD VARCHAR (255) NOT NULL,
PHONE VARCHAR (255) NOT NULL,
ISSTAFF BOOLEAN NOT NULL,
PRIMARY KEY(ID)
);

INSERT INTO USERS(EMAIL,FIRSTNAME,LASTNAME,PASSWORD,PHONE,ISSTAFF)
VALUES
('harry.potter@student.uts.edu.au','Harry','Potter','stag','0412345678',FALSE),
('ron.weasley@student.uts.edu.au','Ron','Weasley','dog','0412666666',FALSE),
('hermione.granger@student.uts.edu.au','Hermione','Granger','otter','0412333444',FALSE),
('albus.dumbledore@uts.edu.au','Albus','Dumbledore','phoenix','1234567890',TRUE),
('minerva.mcgonagall@uts.edu.au','Minerva','Mcgonagall','cat','041111111',TRUE);

DROP TABLE PRODUCTS;

CREATE TABLE PRODUCTS(
PRODUCTID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 100, INCREMENT BY 1),
PRODUCTNAME VARCHAR (255) NOT NULL,
UNITPRICE DECIMAL (10,2) NOT NULL,
PRODUCTTYPE VARCHAR (255) NOT NULL,
QUANTITY INT NOT NULL,
PRIMARY KEY(PRODUCTID)
);

INSERT INTO PRODUCTS(PRODUCTNAME, UNITPRICE,PRODUCTTYPE,QUANTITY)
VALUES
('Drone',699.99,'robot',12),
('Apple Watch',299.99,'wearable',20),
('Amazon Alexa',666.66,'spyware',25),
('Google echo',123.45,'spyware',15),
('Fancy doorbell',50.20,'home',12);

SELECT * FROM PRODUCTS;

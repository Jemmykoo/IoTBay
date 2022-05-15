/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  Jemima
 * Created: 08/05/2022
 */
DROP TABLE CART;
DROP TABLE PAYMENT;
DROP TABLE ORDERS;
DROP TABLE USERS;
DROP TABLE PRODUCTS;


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
('minerva.mcgonagall@uts.edu.au','Minerva','Mcgonagall','cat','041111111',TRUE),
('john.doe@student.uts.edu.au','john','doe','johnny','0498989898',FALSE),
('salt.pepper@uts.edu.au','salt','pepper','whitespice','0400000000',TRUE),
('Gavin.Du@uts.edu.au','Gavin','Du','SaltBar','041111113',TRUE),
('David.Phung@uts.edu.au','David','Phung','Nekonatic','041111143',TRUE),
('Jemima.Alice@student.uts.edu.au','Jemima','Alice','FEITLurker','0419890898',FALSE),
('Net.Beans@student.uts.edu.au','Net','Bean','SucksLmao','0419670898',FALSE),
('Asus.Strix@student.uts.edu.au','Asus','Strix','GTX1080TI','0411370898',FALSE),
('Shiro.Doggo@student.uts.edu.au','Shiro','Doggo','WoofWoof','0413470898',FALSE),
('Isabella.Pham@student.uts.edu.au','Isabella','Pham','WoofWoofIDKLol','0413490898',FALSE),
('Garen.Kat@student.uts.edu.au','Garen','Kat','Shipped','0413430898',FALSE),
('Zedd.Shen@student.uts.edu.au','Zedd','Shen','ShippedBros','0495430898',FALSE),
('Lux.Ezreal@student.uts.edu.au','Lux','Ezreal','ReloShippedidk','0495432898',FALSE),
('Demon.Slayer@student.uts.edu.au','Demon','Slayer','idkShonenAnimeLol','0495242898',FALSE),
('Uni.Qlo@student.uts.edu.au','Uni','Qlo','01504084','0495240098',FALSE),
('Alex.Wong@student.uts.edu.au','Alex','Wong','lmaoidkdoesitevenmatter','0452240198',FALSE),
('Patrick.Ashley@student.uts.edu.au','Patrick','Ashley','whatsortapasswordwouldthismanmakelmaoidk','0452770198',FALSE);


CREATE TABLE PRODUCTS(
PRODUCTID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 100, INCREMENT BY 1),
PRODUCTNAME VARCHAR (255) NOT NULL,
UNITPRICE FLOAT NOT NULL,
PRODUCTTYPE VARCHAR (255) NOT NULL,
QUANTITY INT NOT NULL,
PRODUCTDESCRIPTION VARCHAR (255) NOT NULL,
PRIMARY KEY(PRODUCTID)
);

INSERT INTO PRODUCTS(PRODUCTNAME, UNITPRICE,PRODUCTTYPE,QUANTITY,PRODUCTDESCRIPTION)
VALUES
('Drone',699.99,'robot',12,'flying object'),
('Apple Watch',299.99,'wearable',20,'wearable watch and fitbit'),
('Amazon Alexa',666.66,'spyware',25,'home'),
('Google echo',123.45,'spyware',15,'home'),
('Fancy doorbell',50.23,'home',12,'video camera doorbell'),
('Iphone1',699.99,'mobile phones',10,'Apple Iphone'),
('Iphone2',899.99,'mobile phones',22,'Apple Iphone'),
('Iphone3',666.66,'mobile phones',20,'Apple Iphone'),
('Iphone4',123.45,'mobile phones',12,'Apple Iphone'),
('Iphone11',506.23,'mobile phones',1,'ring ring'),
('Plane',699.99,'rc items',12,'UFO'),
('RC Car',299.99,'rc items',20,'Broom Broom'),
('RC Helicopter',666.66,'rc items',25,'wow it goes in circles'),
('3d printer',123.45,'printer',15,'print print'),
('fancy 3d printer',50.23,'printer',12,'fancy hp inkjet'),
('Submarine',6999.99,'Weapons',12,'Reallly big requires big pool'),
('Battery',299.99,'Tesla',20,'Small Battery'),
('Big Battery',666.66,'Tesla',25,'Big Battery is big'),
('House',12345678.45,'1 bedroom studio',15,'Its in sydney'),
('Honestly run out of items here',50.23,'random stuff',12,'Use your imagination')
;


CREATE TABLE ORDERS(
ORDERID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 10000, INCREMENT BY 1),
ID INTEGER NOT NULL,
ORDERDATE DATE NOT NULL,
ORDERPRICE DOUBLE NOT NULL,
PRIMARY KEY(ORDERID),
FOREIGN KEY(ID) REFERENCES USERS(ID)
);

INSERT INTO ORDERS(ID,ORDERDATE,ORDERPRICE)
VALUES
(100001,'05/10/2022',699.99),
(100003,'03/27/2022',123.45);


CREATE TABLE CART(
ORDERID INTEGER NOT NULL,
PRODUCTID INTEGER NOT NULL,
FOREIGN KEY(ORDERID) REFERENCES ORDERS(ORDERID),
FOREIGN KEY(PRODUCTID) REFERENCES PRODUCTS(PRODUCTID)
);

INSERT INTO CART(ORDERID,PRODUCTID)
VALUES
(10000,100),
(10001,103);

CREATE TABLE PAYMENT(
PAYMENTID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1000, INCREMENT BY 1),
PAYMENTMETHOD VARCHAR (20) NOT NULL,
NAMEONCARD VARCHAR (255) NOT NULL,
CARDNUMBER VARCHAR (19) NOT NULL,
EXPIRYDATE VARCHAR (10) NOT NULL,
CVV VARCHAR (10) NOT NULL,
ORDERID INTEGER NOT NULL,
PRIMARY KEY (PAYMENTID),
FOREIGN KEY(ORDERID) REFERENCES ORDERS(ORDERID)
);

INSERT INTO PAYMENT(PAYMENTMETHOD,NAMEONCARD,CARDNUMBER,EXPIRYDATE,CVV,ORDERID)
VALUES
('Credit Card','Ron Weasley','4622 6300 0013 3464','06/2025','256',10000),
('Credit Card','Albus Dumbledore','4622 6300 1156 9348','02/2023','834',10001);


SELECT * FROM USERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM CART;
SELECT * FROM PAYMENT;

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
(100000,'03/27/2022',123.45),
(100001,'05/05/2021',699.99),
(100002,'03/05/2022',546.23),
(100003,'10/23/2021',785.32),
(100004,'07/20/2021',985.23),
(100005,'08/15/2021',124.76),
(100006,'06/25/2021',982.12),
(100007,'09/09/2021',657.34),
(100008,'12/12/2021',113.43),
(100009,'02/04/2022',987.32),
(100010,'01/24/2022',903.23),
(100011,'03/18/2022',768.34),
(100012,'02/12/2022',723.12),
(100013,'03/15/2022',984.45),
(100014,'01/27/2022',731.23),
(100015,'04/20/2022',763.45),
(100016,'07/20/2021',573.21),
(100017,'10/30/2021',834.56),
(100018,'06/04/2021',923.60),
(100019,'06/29/2021',734.58);


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
('Credit Card','Ron Weasley','4622630000133464','2025-06','256',10000),
('Credit Card','Albus Dumbledore','4622630011569348','2023-02','834',10001),
('Credit Card','Patrick La','4622630074776464','2030-06','633',10002),
('Credit Card','Brendan Ly','4622630011739348','2024-08','466',10003),
('Credit Card','Terence Nguyen','46226300113458','2022-10','599',10004),
('Credit Card','David Pham','1212458743265756','2026-09','602',10005),
('Credit Card','Renee Cheng','1234567234876456','2023-02','292',10006),
('Credit Card','Brian Huynh','16578490123456','2027-07','953',10007),
('Credit Card','Lilianne Phan','9864567890673456','2029-10','815',10008),
('Credit Card','Banana Apple','0099999990123456','2026-08','908',10009),
('Credit Card','Bottle Cup','6666667890123456','2027-02','137',10010),
('Credit Card','Michelle Huynh','2346456899823456','2025-03','638',10011),
('Credit Card','Fire Mage','7946138521346791','2025-06','100',10012),
('Credit Card','Hot Star','2004021657845456','2023-03','154',10013),
('Credit Card','Shash Slash','7477562335678906','2025-02','200',10014),
('Credit Card','Asus Key','6904567896489456','2022-09','309',10015),
('Credit Card','Cloud Head','8248567350023456','2026-12','634',10016),
('Credit Card','Khaz Le','9740567898875456','2026-11','724',10017),
('Credit Card','Gwen Sciz','157906789039316','2028-02','839',10018),
('Credit Card','IoT bay','1236422861919277','2028-03','502',10019);


SELECT * FROM USERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM CART;
SELECT * FROM PAYMENT;

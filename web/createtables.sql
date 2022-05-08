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
PRIMARY KEY(ID)
);

INSERT INTO USERS(EMAIL,FIRSTNAME,LASTNAME,PASSWORD,PHONE)
VALUES
('harry.potter@student.uts.edu.au','Harry','Potter','stag','0412345678'),
('ron.weasley@student.uts.edu.au','Ron','Weasley','dog','0412666666'),
('hermione.granger@student.uts.edu.au','Hermione','Granger','otter','0412333444');


SELECT * FROM USERS;
CREATE DATABASE e102;
use e102;

CREATE TABLE Employee( 
	Fname VARCHAR(15) NOT NULL, -- Adding columns
	Minit CHAR,
	Lname VARCHAR(15) NOT NULL, -- NOT NULL means the domain must have a value
	Bdate DATE, -- Date, YYYY-MM-DD
	Address VARCHAR(30), -- Variable length CHAR array (string)
	Sex CHAR, -- Single character
	Salary DECIMAL(10,2), -- Decimal up to a precision of two decimal points
	Super_ssn CHAR(9),	
	Dno INT NOT NULL,
	Ssn CHAR(9) NOT NULL, -- CHAR padded to 9 spaces
	PRIMARY KEY (Ssn) -- Primary key constraint
);


CREATE TABLE DEPARTMENT( 
	Dname VARCHAR(15) NOT NULL, -- Adding columns
	Dnumber INT NOT NULL,
	Mgr_ssn CHAR(9) NOT NULL,
	Mgr_start_date DATE, -- Date, YYYY-MM-DD
	PRIMARY KEY (Dnumber), -- Primary key constraint
	UNIQUE (Dname), --Unique value constrain - no department have the same name
	FOREIGN KEY (Mgr_ssn) REFERENCES Employee(Ssn)
);


CREATE TABLE DEPT_LOCATIONS( 
	Dnumber INT NOT NULL,
	Dlocation VARCHAR(15) NOT NULL, -- Adding columns
	PRIMARY KEY (Dlocation), -- Primary key constraint
	UNIQUE (Dlocation), --Unique value constrain - no department have the same name
	FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
);


CREATE TABLE WORKS_ON(
	Essn CHAR(9) NOT NULL,
	Pno INT NOT NULL,
	Hours INT NOT NULL,
	PRIMARY KEY (Pno),
	FOREIGN KEY (Essn) REFERENCES Employee(Ssn)
);


CREATE TABLE DEPENDENT(
	Essn CHAR(9) NOT NULL,
	Dependent_name VARCHAR(15) NOT NULL,
	Sex CHAR,
	Bdate DATE,
	Relationship VARCHAR(20) NOT NULL,
	PRIMARY KEY (Dependent_name),
	UNIQUE (Dependent_name),
	FOREIGN KEY (Essn) REFERENCES Employee(Ssn)
);


CREATE TABLE PROJECT(
	Pname VARCHAR(20) NOT NULL,
	Pnumber INT NOT NULL,
	Plocation VARCHAR(30),
	Dnum INT NOT NULL,
	PRIMARY KEY (Pnumber),
	UNIQUE (Pname),
	FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
);


--enter data to the table
INSERT INTO employee VALUES('Nadeesha','D','Madhuranga','1998-05-10','No 7, Main road Kothmale','M',15624.45,'164724864',1,'423567283'),
('Anuvathan','A','Anpalakan','1997-03-22','No 2, Kilinochchiya','M',47000.25,'435246723',5,'928376524'),
('Isuru','C','Akalanka','1997-07-05','No 23, Haldhanduwana','M',36528.92,'546378683',2,'332736483'),
('Anjana','E','Nuwansiri','1997-12-30','No 15, Badulla','M',28975.75,'657472438',9,'542678905');

INSERT INTO DEPARTMENT VALUES('Computer',2,'332736483','2021-06-03'),
('Civil',9,'542678905','2021-01-20'),
('ELec',1,'423567283','2020-09-13'),
('Mechanical',5,'928376524','2020-06-08');

INSERT INTO DEPT_LOCATIONS VALUES(5,'64 67 32 09'),
(1,'98 45 62 82'),
(9,'71 63 82 23'),
(2,'57 91 30 20');

INSERT INTO WORKS_ON VALUES('423567283',35,11),
('542678905',9,8),
('928376524',12,14),
('332736483',42,6);

INSERT INTO DEPENDENT VALUES('928376524','New York','M','1997-03-22','Partner'),
('542678905','Cape Town','M','1997-12-30','Friend'),
('332736483','Sydny','M','1997-07-05','Farther'),
('423567283','Melbourn','M','1998-05-10','Brother');

INSERT INTO PROJECT VALUES('VEGA',12,'46 83 42 19',5),
('ADOBE',9,'49 72 59 30',9),
('TESLA',42,'95 36 29 77',2),
('MICROSOFT',35,'12 59 89 40',1);


SELECT * FROM Employee;
SELECT * FROM DEPARTMENT;
SELECT * FROM DEPT_LOCATIONS;
SELECT * FROM WORKS_ON;
SELECT * FROM DEPENDENT;
SELECT * FROM PROJECT;

DROP TABLE Employee;
DROP TABLE DEPARTMENT;
DROP TABLE DEPT_LOCATIONS;
DROP TABLE WORKS_ON;
DROP TABLE DEPENDENT;
DROP TABLE PROJECT;




--ANSWERS//
--a)
SELECT * FROM Employee WHERE Ssn > 0;

--b)
SELECT Fname, Address FROM Employee WHERE Salary > 35000.00;

--c)
SELECT DEPARTMENT.Dname,DEPT_LOCATIONS.Dlocation
FROM DEPARTMENT
JOIN DEPT_LOCATIONS ON DEPARTMENT.Dnumber=DEPT_LOCATIONS.Dnumber;

--d)
SELECT Employee.Fname, DEPT_LOCATIONS.Dlocation
From Employee
JOIN DEPT_LOCATIONS ON DEPT_LOCATIONS.Dnumber=Employee.Dno;

--e)


--f)
SELECT Employee.Fname, DEPENDENT.Dependent_name, DEPENDENT.Relationship
From Employee
JOIN DEPENDENT ON DEPENDENT.Essn=Employee.Ssn;

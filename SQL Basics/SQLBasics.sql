--Query 5
CREATE DATABASE Organisation;

--Query 6,7,8,9,10,12,13

CREATE TABLE Employee
(
  EmployeeId INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL UNIQUE,
  LastName VARCHAR(50) NOT NULL,
  Gender CHARACTER(1),
  Active BIT DEFAULT 'true',
  Salary INT,
  Designation VARCHAR(50),
  HalfYearlyGrade INT,
  Age INT CHECK(Age>20)
);

INSERT INTO Employee
VALUES(101,'Nipun','Chawla','M','true',25000,'Trainee',1,22);
INSERT INTO Employee
VALUES(102,'Rishabh','Sethi','M','false',35000,'Software Enineer',2,28);
INSERT INTO Employee
VALUES(103,'Swati','Gakhar','F','true',45000,'Software Enineer',2,34);
INSERT INTO Employee
VALUES(104,'Aastha','Sharma','F','true',55000,'Software Enineer',3,40);
INSERT INTO Employee
VALUES(105,'Vaishali','Taneja','F','false',65000,'Software Enineer',3,45);


SELECT * FROM Employee;

--Query 14

CREATE TABLE Designation
(
  EmployeeId INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Gender CHARACTER(1),
  Active BIT DEFAULT 'true',
  Salary INT,
  Designation VARCHAR(50),
  HalfYearlyGrade INT,
  Age INT CHECK(Age>20)
);

INSERT INTO Designation
VALUES(101,'Nipun','Chawla','M','true',25000,'Trainee',1,22);

SELECT * FROM Designation;

DROP TABLE Designation;

SELECT * FROM Designation;

--Query 15

CREATE UNIQUE INDEX FirstNameIndex
ON Employee (FirstName);

CREATE UNIQUE INDEX LastNameIndex
ON Employee (LastName);

--Query 16,11


CREATE TABLE Designation
(
  DesignationId INT PRIMARY KEY,
  DesignationName VARCHAR(50) NOT NULL,
);

INSERT INTO Designation
VALUES(1001,'Trainee');
INSERT INTO Designation
VALUES(1002,'Software Engineer');
INSERT INTO Designation
VALUES(1003,'Software Engineer');
INSERT INTO Designation
VALUES(1004,'Software Engineer');
INSERT INTO Designation
VALUES(1005,'Software Engineer');

SELECT * FROM Designation;

ALTER TABLE Employee
ALTER COLUMN Designation int;
  
ALTER TABLE Employee 
ADD FOREIGN KEY(Designation)
REFERENCES Designation(DesignationId);

--Query 17

SELECT salary FROM Employee WHERE Salary IN(25000,35000);

--Query 18

SELECT salary FROM Employee WHERE Salary BETWEEN 25000 AND 45000;

--Query 19

SELECT FirstName AS Name FROM Employee;

--Query 20

CREATE TABLE EmployeeSlab
(
  EmployeeId INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL UNIQUE,
);

INSERT INTO Employee
VALUES(101,'Nipun Chawla');
INSERT INTO Employee
VALUES(102,'Rishabh Sethi');
INSERT INTO Employee
VALUES(103,'Swati Gakhar');

SELECT * FROM Employee JOIN EmployeeSlab
ON Employee.EmployeeId=EmployeeSlab.EmployeeId;


--Query 21

SELECT * FROM Employee INNER JOIN EmployeeSlab
ON Employee.EmployeeId=EmployeeSlab.EmployeeId;


--Query 22

SELECT * FROM Employee LEFT OUTER JOIN EmployeeSlab
ON Employee.EmployeeId=EmployeeSlab.EmployeeId;

--Query 23

SELECT * FROM Employee RIGHT OUTER JOIN EmployeeSlab
ON Employee.EmployeeId=EmployeeSlab.EmployeeId;

--Query 24

SELECT * FROM Employee FULL OUTER JOIN EmployeeSlab
ON Employee.EmployeeId=EmployeeSlab.EmployeeId;

--Query 25

CREATE TABLE ABC
(
  EmployeeId INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL UNIQUE,
  LastName VARCHAR(50) NOT NULL,
  Gender CHARACTER(1),
  Active BIT DEFAULT 'true',
  Salary INT,
  Designation VARCHAR(50),
  HalfYearlyGrade INT,
  Age INT CHECK(Age>20)
);

INSERT INTO ABC
VALUES(101,'Nipun','Chawla','M','true',25000,'Trainee',1,22);
INSERT INTO ABC
VALUES(102,'Rishabh','Sethi','M','false',35000,'Software Enineer',2,28);
INSERT INTO ABC
VALUES(103,'Swati','Gakhar','F','true',45000,'Software Enineer',2,34);
INSERT INTO ABC
VALUES(104,'Aastha','Sharma','F','true',55000,'Software Enineer',3,40);
INSERT INTO ABC
VALUES(105,'Vaishali','Taneja','F','false',65000,'Software Enineer',3,45);


CREATE TABLE LMN
(
  EmployeeId INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL UNIQUE,
  LastName VARCHAR(50) NOT NULL,
  Gender CHARACTER(1),
  Active BIT DEFAULT 'true',
  Salary INT,
  Designation VARCHAR(50),
  HalfYearlyGrade INT,
  Age INT CHECK(Age>20)
);

INSERT INTO LMN
VALUES(106,'Nipun','Chawla','M','true',25000,'Trainee',1,22);
INSERT INTO LMN
VALUES(107,'Rishabh','Sethi','M','false',35000,'Software Enineer',2,28);
INSERT INTO LMN
VALUES(108,'Swati','Gakhar','F','true',45000,'Software Enineer',2,34);
INSERT INTO LMN
VALUES(109,'Aastha','Sharma','F','true',55000,'Software Enineer',3,40);
INSERT INTO LMN
VALUES(110,'Vaishali','Taneja','F','false',65000,'Software Enineer',3,45);


CREATE TABLE XYZ
(
  EmployeeId INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL UNIQUE,
  LastName VARCHAR(50) NOT NULL,
  Gender CHARACTER(1),
  Active BIT DEFAULT 'true',
  Salary INT,
  Designation VARCHAR(50),
  HalfYearlyGrade INT,
  Age INT CHECK(Age>20)
);

INSERT INTO XYZ
VALUES(111,'Nipun','Chawla','M','true',25000,'Trainee',1,22);
INSERT INTO XYZ
VALUES(112,'Rishabh','Sethi','M','false',35000,'Software Enineer',2,28);
INSERT INTO XYZ
VALUES(113,'Swati','Gakhar','F','true',45000,'Software Enineer',2,34);
INSERT INTO XYZ
VALUES(114,'Aastha','Sharma','F','true',55000,'Software Enineer',3,40);
INSERT INTO XYZ
VALUES(115,'Vaishali','Taneja','F','false',65000,'Software Enineer',3,45);

SELECT * FROM ABC UNION ALL 
SELECT * FROM LMN UNION ALL 
SELECT * FROM XYZ;


--Query 26

SELECT * INTO Employee_Backup IN 'Another.mdb' FROM Employee;

--Query 27

UPDATE Employee SET Salary = Salary+5000;

--Query 28

ALTER TABLE Employee
ADD DateOfJOINING DATE;

CREATE VIEW DetailView AS 
SELECT DateOfJoining  FROM Employee
WHERE Salary > 60000;

--Query 30

CREATE TABLE Employee
(
  EmployeeId INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL UNIQUE,
  LastName VARCHAR(50) NOT NULL,
  Gender CHARACTER(1),
  Active BIT DEFAULT 'true',
  Salary INT,
  Designation VARCHAR(50),
  HalfYearlyGrade INT,
  Age INT CHECK(Age>20)
);

INSERT INTO Employee
VALUES(101,'Nipun','Chawla','M','true',25000,'Trainee',1,22);
INSERT INTO Employee
VALUES(102,'Rishabh','Sethi','M','false',35000,'Software Enineer',2,28);
INSERT INTO Employee
VALUES(103,'Swati','Gakhar','F','true',45000,'Software Enineer',2,34);
INSERT INTO Employee
VALUES(104,'Aastha','Sharma','F','true',55000,'Software Enineer',3,40);
INSERT INTO Employee
VALUES(105,'Vaishali','Taneja','F','false','','Software Enineer',3,45);

SELECT SUM(ISNULL(Salary,0)) FROM Employee;













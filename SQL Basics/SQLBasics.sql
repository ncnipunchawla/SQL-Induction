--Query 5
CREATE DATABASE Organisation;

USE Organisation;

GO

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
ADD DesignationId int;
  
ALTER TABLE Employee 
ADD FOREIGN KEY(DesignationId)
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
  Name VARCHAR(50) NOT NULL
);

INSERT INTO EmployeeSlab
VALUES(101,'Nipun Chawla');
INSERT INTO EmployeeSlab
VALUES(102,'Rishabh Sethi');
INSERT INTO EmployeeSlab
VALUES(103,'Swati Gakhar');

SELECT * FROM Employee JOIN EmployeeSlab
ON Employee.EmployeeId=EmployeeSlab.EmployeeId;


--Query 21

SELECT * FROM Employee INNER JOIN EmployeeSlab
ON Employee.EmployeeId=EmployeeSlab.EmployeeId;


--Query 22

CREATE TABLE Department
(
  DepartmentId INT PRIMARY KEY,
  EmployeeId INT,
  DepartmentName VARCHAR(50) NOT NULL,
);

INSERT INTO Department
VALUES(1001,101,'IT');
INSERT INTO Department
VALUES(1002,102,'');
INSERT INTO Department
VALUES(1003,103,'CS');
INSERT INTO Department
VALUES(1004,104,'CS');
INSERT INTO Department
VALUES(1005,105,'HR');

DELETE FROM Department WHERE EmployeeId=105;
DELETE FROM Department WHERE EmployeeId=102;


SELECT Employee.FirstName,Department.DepartmentName FROM Employee 
LEFT OUTER JOIN Department
ON Employee.EmployeeId=Department.EmployeeId;

--Query 23

SELECT Employee.FirstName,Department.DepartmentName FROM Employee 
RIGHT OUTER JOIN Department
ON Employee.EmployeeId=Department.EmployeeId;

--Query 24

SELECT Employee.FirstName,Department.DepartmentName FROM Employee 
FULL OUTER JOIN Department
ON Employee.EmployeeId=Department.EmployeeId;

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

CREATE DATABASE Another;

SELECT * INTO Employee_Backup IN 'Another' FROM Employee;

--Query 27

UPDATE Employee SET Salary = Salary+5000;

SELECT * FROM Employee;

--Query 28

ALTER TABLE Employee
ADD DateOfJOINING DATE;

CREATE VIEW DetailView AS 
SELECT FirstName,LastName,DateOfJOINING,Salary  FROM Employee
WHERE Salary > 60000;

SELECT * FROM DetailView;

--Query 29


SELECT  LEFT(DATENAME(WEEKDAY,GETDATE()),3)+' '
+LEFT(DATENAME(DAY,GETDATE()),2)+'th'+' '
+LEFT(DATENAME(MONTH,GETDATE()),3)+' '
+RIGHT(DATENAME(YEAR,GETDATE()),2)+','+' '
+LEFT(DATENAME(HOUR,GETDATE()),2)+':'
+LEFT(DATENAME(MINUTE,GETDATE()),2)+' '+'pm' AS CurrentDate;

SELECT LEFT(DATENAME(WEEKDAY,DATEADD(DAY,2,GETDATE())),3)+' '
+LEFT(DATENAME(DAY,DATEADD(DAY,2,GETDATE())),2)+'th'+' '
+LEFT(DATENAME(MONTH,DATEADD(DAY,2,GETDATE())),3)+' '
+RIGHT(DATENAME(YEAR,DATEADD(DAY,2,GETDATE())),2)+','+' '
+LEFT(DATENAME(HOUR,DATEADD(DAY,2,GETDATE())),2)+':'
+LEFT(DATENAME(MINUTE,DATEADD(DAY,2,GETDATE())),2)+' '+'pm'
 AS CurrentDateAdd2;

--Query 30

UPDATE Employee 
SET Salary='' WHERE FirstName='Nipun';

SELECT SUM(ISNULL(Salary,0)) FROM Employee;

--Query 31

UPDATE Employee
SET Gender=null WHERE FirstName='Vaishali';

SELECT * FROM Employee WHERE Gender IS NULL;

--Query 32

ALTER TABLE Employee
ADD Pf int;

UPDATE Employee
SET Pf = Salary*.1275;

SELECT ROUND(Pf,2) FROM Employee;

--Query 34

SELECT * FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

--Query 35

SELECT Department.DepartmentName,COUNT(Employee.EmployeeId) 
AS NumberOfEmployee FROM Employee
JOIN Department
ON Employee.EmployeeId=Department.EmployeeId
GROUP BY DepartmentName;

--Query 36

SELECT * FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee); 

--Query 37

SELECT * FROM Employee
WHERE Salary < (SELECT MIN(Salary) FROM Employee); 

--Query 38

SELECT SUM(Salary) FROM Employee;

--Query 39

SELECT Department.DepartmentName,COUNT(Employee.EmployeeId) 
AS NumberOfEmployee FROM Employee
JOIN Department
ON Employee.EmployeeId=Department.EmployeeId
GROUP BY DepartmentName;

--Query 41

SELECT FirstName,UPPER(LastName) FROM Employee;

--Query 42

SELECT FirstName,LOWER(LastName) FROM Employee;

--Query 43

SELECT LEN(FirstName) AS Length FROM Employee;

--Query 44

CREATE TABLE EmployeeSalary
(
  EmployeeSalary INT,
  EmployeeName VARCHAR(50) NOT NULL
);

INSERT INTO EmployeeSalary
VALUES(25000.99,'Nipun');
INSERT INTO EmployeeSalary
VALUES(35000.89,'Rishabh');
INSERT INTO EmployeeSalary
VALUES(45000,'Swati');
INSERT INTO EmployeeSalary
VALUES(55000.50,'Aastha');
INSERT INTO EmployeeSalary
VALUES(65000,'Vaishali');

SELECT EmployeeName,ROUND(EmployeeSalary,0) FROM EmployeeSalary;

--Query 45

SELECT *,GETDATE() AS CurrentDate FROM Employee;

--Query 46

SELECT FirstName,Salary,CONVERT(VARCHAR(20),GETDATE(),105) AS Today,
CONVERT(VARCHAR(19),GETDATE(),0) AS Today,
CONVERT(VARCHAR(10),GETDATE(),10) AS Today,
CONVERT(VARCHAR(10),GETDATE(),110) AS Today,
CONVERT(VARCHAR(11),GETDATE(),6) AS Today,
CONVERT(VARCHAR(11),GETDATE(),106) AS Today,
CONVERT(VARCHAR(24),GETDATE(),113) AS Today FROM Employee;

--Query 47

SELECT CAST(EmployeeId AS VARCHAR(10)) AS EmpId FROM Employee;

--Query 48

SELECT CASE
		WHEN Salary>=50000 AND Age<35 THEN 'Yes'
		ELSE 'No'
		END
FROM Employee;


--Query 49

SELECT * FROM (SELECT FirstName,LastName,Salary,RANK()
OVER(ORDER BY Salary DESC) AS Rank FROM Employee) 
AS Temp  WHERE Temp.Rank < 4;

SELECT * FROM (SELECT FirstName,LastName,Salary,ROW_NUMBER()
OVER(ORDER BY Salary DESC) AS AlternateRank FROM Employee) 
AS Temp  WHERE Temp.AlternateRank %2 = 1;

--Query 50

WITH EmployeeCTE (FirstName,LastName,Salary)
AS(SELECT FirstName,LastName,Salary FROM Employee)
SELECT * FROM EmployeeCTE;

--Query 51

SELECT Department.DepartmentName,COUNT(Employee.EmployeeId)
AS NumberOfEmployee,SUM(Salary) 
FROM Employee
JOIN Department
ON Employee.EmployeeId=Department.EmployeeId
GROUP BY DepartmentName,Employee.EmployeeId WITH ROLLUP;

SELECT Department.DepartmentName,COUNT(Employee.EmployeeId)
AS NumberOfEmployee,SUM(Salary) 
FROM Employee
JOIN Department
ON Employee.EmployeeId=Department.EmployeeId
GROUP BY DepartmentName,Employee.EmployeeId WITH CUBE;

--Query 52

ALTER TABLE Employee
ADD Experience int;

UPDATE Employee
SET Experience = 3 WHERE EmployeeId = 101;
UPDATE Employee
SET Experience = 5 WHERE EmployeeId = 102;
UPDATE Employee
SET Experience = 7 WHERE EmployeeId = 103;
UPDATE Employee
SET Experience = 9 WHERE EmployeeId = 104;
UPDATE Employee
SET Experience = 11 WHERE EmployeeId = 105;

SELECT * FROM Employee
INTERSECT
SELECT * FROM Employee WHERE Experience < 6;

SELECT * FROM Employee
EXCEPT
SELECT * FROM Employee WHERE Experience >= 6;

--Query 53

SELECT FirstName,Salary,ROW_NUMBER()OVER(ORDER BY Salary) AS Row,(
SELECT 
COUNT(*) AS CountRow FROM Employee) as C from Employee
WHERE Row > c.CountRow-3;







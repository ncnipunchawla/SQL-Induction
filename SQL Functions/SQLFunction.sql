--Query 34

SELECT * FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

--Query 35

SELECT Department.DepartmentName,COUNT(Employee.EmployeeId) 
AS NumberOfEmployee FROM Employee
JOIN Department
ON Employee.DepartmentId=Department.DepartmentId
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
ON Employee.DepartmentId=Department.DepartmentId
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
  EmployeeId INT
);

INSERT INTO EmployeeSalary
VALUES(25000.99,101);
INSERT INTO EmployeeSalary
VALUES(35000.89,102);
INSERT INTO EmployeeSalary
VALUES(45000,103);
INSERT INTO EmployeeSalary
VALUES(55000.50,104);
INSERT INTO EmployeeSalary
VALUES(65000,105);

ALTER TABLE EmployeeSalary 
ADD FOREIGN KEY(EmployeeId)
REFERENCES Employee(EmployeeId);

SELECT EmployeeId,ROUND(EmployeeSalary,0) FROM EmployeeSalary;

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
AS Brilliant FROM Employee;


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
ON Employee.DepartmentId=Department.DepartmentId
GROUP BY DepartmentName,Employee.EmployeeId WITH ROLLUP;

SELECT Department.DepartmentName,COUNT(Employee.EmployeeId)
AS NumberOfEmployee,SUM(Salary) 
FROM Employee
JOIN Department
ON Employee.DepartmentId=Department.DepartmentId
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

SELECT * FROM (SELECT FirstName,LastName,Salary,ROW_NUMBER()
OVER(ORDER BY EmployeeId) AS Rank FROM Employee) 
AS Temp  WHERE Temp.Rank < 4;

--Query 54

SELECT Temp.EmployeeId, Temp.Salary, 
(SELECT SUM(Temp2.Salary)
FROM Employee Temp2
WHERE Temp2.EmployeeId <= Temp.EmployeeId) AS RunningTotal
FROM   Employee Temp
ORDER BY Temp.EmployeeId;

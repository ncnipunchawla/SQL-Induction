CREATE DATABASE Assignment2;

--Table1

CREATE TABLE TEmp
(
EmpId INT PRIMARY KEY IDENTITY(1001,2),
EmpCode VARCHAR(20),
EmpFName VARCHAR(20) NOT NULL,
EmpMName VARCHAR(20),
EmpLName VARCHAR(20) NOT NULL,
EmpDOB DATE CHECK((YEAR(GETDATE())-YEAR(EmpDOB))>=18),
EmpDOJ date NOT NULL
);

INSERT INTO TEmp(EmpCode,EmpFName,EmpMName,EmpLName,EmpDOB,EmpDOJ)
VALUES('OPT20110105','Manmohan','','Singh','1983-02-10','2010-05-25');

INSERT INTO TEmp(EmpCode,EmpFName,EmpMName,EmpLName,EmpDOB,EmpDOJ)
VALUES('OPT20110105','Alfred','Joseph','Lawrence','1988-02-28','2011-06-24');

SELECT * FROM TEmp;

--Table2

CREATE TABLE TActivity
(
ActivityId INT PRIMARY KEY,
ActivityDescription VARCHAR(20)
);

INSERT INTO TActivity
VALUES('1','Code Analysis');
INSERT INTO TActivity
VALUES('2','Lunch');
INSERT INTO TActivity
VALUES('3','Coding');
INSERT INTO TActivity
VALUES('4','Knowledge Transition');
INSERT INTO TActivity
VALUES('5','Database');

SELECT * FROM TActivity;

--Table3

CREATE TABLE TAtten
(
AttenId INT PRIMARY KEY IDENTITY(1001,1),
EmpId INT FOREIGN KEY REFERENCES TEmp(EmpId) ,
ActivityId INT FOREIGN KEY REFERENCES TActivity(ActivityId) ,
AttenStartTime DATETIME,
AttenEndHrs INT
);

INSERT INTO TAtten(EmpId,ActivityId,AttenStartTime,AttenEndHrs)
VALUES(1001,5,'2011/2/13 10:00:00',2);
INSERT INTO TAtten(EmpId,ActivityId,AttenStartTime,AttenEndHrs)
VALUES(1001,1,'2011/1/14 10:00:00',3);
INSERT INTO TAtten(EmpId,ActivityId,AttenStartTime,AttenEndHrs)
VALUES(1001,3,'2011/1/14 13:00:00',5);
INSERT INTO TAtten(EmpId,ActivityId,AttenStartTime,AttenEndHrs)
VALUES(1003,5,'2011/2/16 10:00:00',8);
INSERT INTO TAtten(EmpId,ActivityId,AttenStartTime,AttenEndHrs)
VALUES(1003,5,'2011/2/17 10:00:00',8);
INSERT INTO TAtten(EmpId,ActivityId,AttenStartTime,AttenEndHrs)
VALUES(1003,5,'2011/2/19 10:00:00',7);


SELECT * FROM TAtten


--Table 4

CREATE TABLE TSalary
(
SalaryId INT PRIMARY KEY,
EmpId INT FOREIGN KEY REFERENCES TEmp(EmpId),
ChangedSalary date,
NewSalary FLOAT
);

INSERT INTO TSalary
VALUES(1001,1003,'2011-02-16',20000.00);
INSERT INTO TSalary
VALUES(1002,1003,'2011-01-05',25000.00);
INSERT INTO TSalary
VALUES(1003,1001,'2011-02-16',26000.00);

SELECT * FROM TSalary;

--Question1

SELECT * FROM(
SELECT EmpFName+' '+EmpMName+' '+EmpLName AS Name,
CASE
WHEN MONTH(EmpDOB)IN(1,3,5,7,8,10,12) AND DAY(EmpDOB)=31
THEN EmpDOB
WHEN MONTH(EmpDOB)IN(4,6,9,11) AND DAY(EmpDOB)=30
THEN EmpDOB
WHEN MONTH(EmpDOB)=2
AND DAY(EmpDOB)=28
THEN EmpDOB
END AS DateOfBirth
FROM TEmp)AS S
WHERE S.DateOfBirth IS NOT NULL

--Question2

SELECT EmpFName+' '+EmpMName+' '+EmpLName AS Name,
Increment,PreviousSalary,CurrentSalary, TotalWorkedHours
FROM(
SELECT EmpId,
CASE
	WHEN COUNT(EmpId)>1 
	THEN 'Yes'
	ELSE 'No'
END AS Increment,
CASE
	WHEN COUNT(EmpId)>1 
	THEN MIN(NewSalary)
	ELSE 0
END AS PreviousSalary,
MAX(NewSalary) AS CurrentSalary
FROM TSalary
GROUP BY EmpId) AS Subquery1
JOIN
(
SELECT EmpId,
SUM(AttenEndHrs)AS TotalWorkedHours
FROM TAtten
GROUP BY EmpId
) AS Subquery2
ON Subquery1.EmpId=Subquery2.EmpId
JOIN TEmp
ON TEmp.EmpId=Subquery1.EmpId










--Query 56

CREATE TABLE DummyCluster
(
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Age INT
);

INSERT INTO DummyCluster 
VALUES('Ram','Arora',30);
INSERT INTO DummyCluster 
VALUES('Shyam','Arora',35);
INSERT INTO DummyCluster 
VALUES('Aastha','Sharma',40);


CREATE CLUSTERED INDEX AgeIndex 
ON DummyCluster (Age); 

--Query 57

CREATE NONCLUSTERED INDEX DesignationIdIndex 
ON Employee (DesignationId); 


--Query 58

CREATE TABLE EmployeeSalaryGross
(
	Basic INT,
	HR INT,
	DA INT,
	Gross INT
);


CREATE TRIGGER EmployeeSalaryTrigger ON EmployeeSalaryGross AFTER INSERT 
AS
BEGIN
	UPDATE EmployeeSalaryGross
	SET Gross = (Basic+HR+DA)*12;
END;

INSERT INTO EmployeeSalaryGross 
VALUES(10000,2000,1000,'');
INSERT INTO EmployeeSalaryGross 
VALUES(20000,4000,1000,'');
INSERT INTO EmployeeSalaryGross 
VALUES(30000,4000,1000,'');

SELECT * FROM EmployeeSalaryGross;

--Query 59

UPDATE EmployeeSalaryGross
SET Gross='';


DECLARE 
@CBasic INT, 
@CHR INT,
@CDA INT;
DECLARE EmployeeSalaryCursorr CURSOR FOR 
SELECT Basic, HR,DA
FROM EmployeeSalaryGross

OPEN EmployeeSalaryCursorr

FETCH NEXT FROM EmployeeSalaryCursorr 
INTO @CBasic, @CHR, @CDA

BEGIN

UPDATE EmployeeSalaryGross
SET Gross = (Basic+HR+DA)*12 WHERE HR > 2000;

END;

--Query 61

DECLARE @Year INT;
CREATE FUNCTION Leap(@Year INT)
RETURNS VARCHAR(50)
AS
BEGIN
DECLARE @Temp VARCHAR(50);
IF(@Year % 400=0 OR (@Year % 4=0 AND @Year % 100!=0))
SET @Temp='Leap Year';
ELSE
SET @Temp='Not Leap Year';
RETURN @Temp;
END;

SELECT dbo.Leap(100) AS Result;

--Query 62

DECLARE @GET INT;

CREATE PROCEDURE SEmployeeDetail(@GET INT)
AS 
SELECT * FROM Employee
FULL OUTER JOIN Department
ON Employee.DepartmentId=Department.DepartmentId
FULL OUTER JOIN EmployeeSalary
ON Employee.EmployeeId=EmployeeSalary.EmployeeId WHERE Employee.EmployeeId=@GET;

EXECUTE SEmployeeDetail @GET=101;

--Query 63

DECLARE @Number1 INT,@Number2 INT;

CREATE PROCEDURE DivideZero(@Number1 INT,@Number2 INT)
 AS
 BEGIN
BEGIN TRY

SELECT @Number1/@Number2 AS Result
END TRY
BEGIN CATCH
SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
END;

EXECUTE DivideZero @Number1=5,@Number2=2;

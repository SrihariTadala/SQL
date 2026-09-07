/* Week 6 - Create a simple scalar function */

USE UniversityDB;
GO

DROP FUNCTION IF EXISTS dbo.fn_FullName;
GO

CREATE FUNCTION dbo.fn_FullName
(
    @FirstName VARCHAR(50),
    @LastName  VARCHAR(50)
)
RETURNS VARCHAR(101)
AS
BEGIN
    RETURN @FirstName + ' ' + @LastName;
END;
GO

SELECT StudentID, dbo.fn_FullName(FirstName, LastName) AS FullName
FROM Students
WHERE StudentID <= 5;
GO

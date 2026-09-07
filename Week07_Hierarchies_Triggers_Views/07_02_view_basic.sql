/* Week 7 - Create a simple view */

USE UniversityDB;
GO

DROP VIEW IF EXISTS dbo.vw_StudentBasic;
GO

CREATE VIEW dbo.vw_StudentBasic
AS
SELECT s.StudentID, s.FirstName, s.LastName, s.Email, d.DepartmentName
FROM Students s
INNER JOIN Departments d ON s.DepartmentID = d.DepartmentID;
GO

SELECT TOP 5 StudentID, FirstName, LastName, Email, DepartmentName
FROM dbo.vw_StudentBasic
ORDER BY StudentID;
GO

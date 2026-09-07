/* Week 6 - Stored procedure listing students in a department */

USE UniversityDB;
GO

DROP PROCEDURE IF EXISTS dbo.GetStudentsByDept;
GO

CREATE PROCEDURE dbo.GetStudentsByDept
    @DeptID INT
AS
BEGIN
    SELECT s.StudentID, s.FirstName, s.LastName, d.DepartmentName
    FROM Students s
    INNER JOIN Departments d ON s.DepartmentID = d.DepartmentID
    WHERE s.DepartmentID = @DeptID;
END;
GO

EXEC dbo.GetStudentsByDept @DeptID = 1;
GO

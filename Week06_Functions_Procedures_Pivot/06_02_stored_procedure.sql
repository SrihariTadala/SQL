/* Week 6 - Create a simple stored procedure */

USE UniversityDB;
GO

DROP PROCEDURE IF EXISTS dbo.GetStudentByID;
GO

CREATE PROCEDURE dbo.GetStudentByID
    @StudentID INT
AS
BEGIN
    SELECT StudentID, FirstName, LastName, Email, City, State
    FROM Students
    WHERE StudentID = @StudentID;
END;
GO

EXEC dbo.GetStudentByID @StudentID = 1;
GO

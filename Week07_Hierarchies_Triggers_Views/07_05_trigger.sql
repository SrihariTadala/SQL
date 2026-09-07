/* Week 7 - Create an audit log table and trigger */

USE UniversityDB;
GO

DROP TRIGGER IF EXISTS trg_EnrollmentInsert;
GO

DROP TABLE IF EXISTS EnrollmentLog;
GO

CREATE TABLE EnrollmentLog
(
    LogID        INT IDENTITY(1,1) PRIMARY KEY,
    EnrollmentID INT,
    Action       VARCHAR(10),
    ActionDate   DATETIME DEFAULT GETDATE(),
    ActionUser   VARCHAR(100) DEFAULT SYSTEM_USER
);
GO

CREATE TRIGGER trg_EnrollmentInsert
ON Enrollments
AFTER INSERT
AS
BEGIN
    INSERT INTO EnrollmentLog (EnrollmentID, Action)
    SELECT EnrollmentID, 'INSERT'
    FROM inserted;
END;
GO

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Semester, AcademicYear, Grade)
VALUES (151, 2, 5, 'Fall', 2025, 'A');
GO

SELECT * FROM EnrollmentLog;
GO

DELETE FROM Enrollments WHERE EnrollmentID = 151;
GO

DELETE FROM EnrollmentLog;
GO

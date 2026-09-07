/* Week 7 - Verify the trigger worked and check total enrollments */

USE UniversityDB;
GO

SELECT COUNT(*) AS TotalEnrollments FROM Enrollments;
GO

SELECT * FROM EnrollmentLog;
GO

DELETE FROM Enrollments WHERE EnrollmentID = 151;
GO

DELETE FROM EnrollmentLog;
GO

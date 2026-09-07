/* Week 4 - Date functions */

USE UniversityDB;
GO

SELECT
    StudentID,
    FirstName,
    EnrollmentDate,
    YEAR(EnrollmentDate) AS EnrollYear,
    MONTH(EnrollmentDate) AS EnrollMonth
FROM Students
WHERE StudentID <= 5;
GO

SELECT GETDATE() AS CurrentDateTime;
GO

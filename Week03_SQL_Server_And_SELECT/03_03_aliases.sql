/* Week 3 - Column aliases with AS */

USE UniversityDB;
GO

SELECT
    FirstName AS Forename,
    LastName AS Surname,
    Salary AS AnnualPay
FROM Instructors;
GO

SELECT FirstName + ' ' + LastName AS FullName
FROM Students
WHERE StudentID <= 5;
GO

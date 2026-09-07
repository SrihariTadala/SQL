/* Week 5 - Aggregate functions */

USE UniversityDB;
GO

SELECT
    COUNT(*) AS TotalInstructors,
    AVG(Salary) AS AverageSalary,
    MIN(Salary) AS MinSalary,
    MAX(Salary) AS MaxSalary
FROM Instructors;
GO

SELECT
    SUM(AmountDue) AS TotalBilled,
    SUM(AmountPaid) AS TotalCollected,
    SUM(AmountDue) - SUM(AmountPaid) AS TotalOutstanding
FROM SemesterFees;
GO

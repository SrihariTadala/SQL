/* Week 1 - Looking at SemesterFees table */

USE UniversityDB;
GO

SELECT TOP 10 FeeID, StudentID, Semester, AcademicYear, AmountDue, AmountPaid
FROM SemesterFees
ORDER BY FeeID;
GO

SELECT COUNT(*) AS TotalFeeRecords FROM SemesterFees;
GO

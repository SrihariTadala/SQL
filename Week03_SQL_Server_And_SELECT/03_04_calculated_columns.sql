/* Week 3 - Calculated columns in SELECT */

USE UniversityDB;
GO

SELECT
    FeeID,
    StudentID,
    AmountDue,
    AmountPaid,
    AmountDue - AmountPaid AS Balance
FROM SemesterFees
WHERE FeeID <= 10;
GO

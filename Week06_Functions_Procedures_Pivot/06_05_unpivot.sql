/* Week 6 - UNPIVOT: show fee amounts in rows */

USE UniversityDB;
GO

SELECT FeeID, StudentID, FeeType, Amount
FROM
(
    SELECT FeeID, StudentID, AmountDue, AmountPaid
    FROM SemesterFees
    WHERE FeeID <= 5
) AS SourceData
UNPIVOT
(
    Amount FOR FeeType IN (AmountDue, AmountPaid)
) AS UnpivotTable
ORDER BY FeeID, FeeType;
GO

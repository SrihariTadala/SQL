/* Week 5 - HAVING to filter grouped results */

USE UniversityDB;
GO

SELECT DepartmentID, COUNT(*) AS StudentCount
FROM Students
GROUP BY DepartmentID
HAVING COUNT(*) > 6;
GO

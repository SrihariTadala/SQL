/* Week 5 - GROUP BY */

USE UniversityDB;
GO

SELECT DepartmentID, COUNT(*) AS StudentCount
FROM Students
GROUP BY DepartmentID
ORDER BY DepartmentID;
GO

SELECT Semester, AcademicYear, COUNT(*) AS EnrollmentCount
FROM Enrollments
GROUP BY Semester, AcademicYear
ORDER BY AcademicYear, Semester;
GO

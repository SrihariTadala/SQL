/* Week 6 - PIVOT: count enrollments by year and semester */

USE UniversityDB;
GO

SELECT AcademicYear, [Fall], [Spring]
FROM
(
    SELECT AcademicYear, Semester, EnrollmentID
    FROM Enrollments
) AS SourceData
PIVOT
(
    COUNT(EnrollmentID)
    FOR Semester IN ([Fall], [Spring])
) AS PivotTable
ORDER BY AcademicYear;
GO

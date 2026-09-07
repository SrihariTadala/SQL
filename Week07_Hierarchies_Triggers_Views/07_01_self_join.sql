/* Week 7 - Self join: course prerequisites */

USE UniversityDB;
GO

SELECT
    c.CourseCode AS Course,
    c.CourseName,
    p.CourseCode AS PrerequisiteCode,
    p.CourseName AS PrerequisiteName
FROM Courses c
INNER JOIN Courses p ON c.PrerequisiteCourseID = p.CourseID
ORDER BY c.CourseCode;
GO

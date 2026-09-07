/* Week 4 - CASE expression */

USE UniversityDB;
GO

SELECT
    CourseCode,
    CourseName,
    Credits,
    CASE
        WHEN Credits >= 4 THEN 'Heavy'
        ELSE 'Light'
    END AS CourseLoad
FROM Courses;
GO

/* Week 4 - String functions */

USE UniversityDB;
GO

SELECT
    FirstName,
    LastName,
    UPPER(LastName) AS LastNameUpper,
    LEN(FirstName) AS NameLength
FROM Students
WHERE StudentID <= 5;
GO

SELECT
    CourseCode,
    LEFT(CourseCode, 2) AS SubjectCode,
    RIGHT(CourseCode, 3) AS CourseNumber
FROM Courses
WHERE CourseID <= 6;
GO

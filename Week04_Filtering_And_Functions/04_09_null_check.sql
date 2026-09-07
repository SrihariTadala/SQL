/* Week 4 - Checking for NULLs */

USE UniversityDB;
GO

SELECT StudentID, FirstName, LastName, City, State
FROM Students
WHERE City IS NULL;
GO

SELECT CourseCode, CourseName, InstructorID
FROM Courses
WHERE InstructorID IS NULL;
GO

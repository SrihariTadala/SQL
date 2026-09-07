/* Week 3 - Selecting specific columns */

USE UniversityDB;
GO

SELECT StudentID, FirstName, LastName, City, State
FROM Students
WHERE StudentID <= 10;
GO

SELECT CourseCode, CourseName, Credits
FROM Courses;
GO

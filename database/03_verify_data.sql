/* Verify the data
   Run this after loading, or any time, to check the database is in
   the state it should be. Every script in the weekly folders puts
   back whatever it changed, so these numbers should never move. */

USE UniversityDB;
GO

-- Row counts. These are the numbers every week's README refers to.
SELECT 'Departments'  AS TableName, COUNT(*) AS Rows, 6   AS Expected FROM Departments
UNION ALL SELECT 'Instructors',  COUNT(*), 12  FROM Instructors
UNION ALL SELECT 'Students',     COUNT(*), 40  FROM Students
UNION ALL SELECT 'Courses',      COUNT(*), 20  FROM Courses
UNION ALL SELECT 'Enrollments',  COUNT(*), 150 FROM Enrollments
UNION ALL SELECT 'SemesterFees', COUNT(*), 80  FROM SemesterFees;
GO

-- The NULLs that were left in deliberately, for Week 4 and 5 practice.
SELECT
    (SELECT COUNT(*) FROM Students   WHERE City IS NULL)         AS StudentsWithNoCity,
    (SELECT COUNT(*) FROM Enrollments WHERE GradePoints IS NULL) AS EnrollmentsNotGraded,
    (SELECT COUNT(*) FROM Courses    WHERE InstructorID IS NULL) AS CoursesWithNoInstructor;
GO

-- No orphans. Every foreign key should point at a row that exists,
-- so all of these must be 0.
SELECT
    (SELECT COUNT(*) FROM Students s
     LEFT JOIN Departments d ON d.DepartmentID = s.DepartmentID
     WHERE d.DepartmentID IS NULL) AS OrphanStudents,
    (SELECT COUNT(*) FROM Enrollments e
     LEFT JOIN Students s ON s.StudentID = e.StudentID
     WHERE s.StudentID IS NULL)    AS OrphanEnrollments,
    (SELECT COUNT(*) FROM Courses c
     LEFT JOIN Departments d ON d.DepartmentID = c.DepartmentID
     WHERE d.DepartmentID IS NULL) AS OrphanCourses;
GO

-- No practice table should be left behind. Each weekly script drops
-- whatever it created, so this must come back empty.
SELECT name AS LeftoverPracticeTable
FROM sys.tables
WHERE name NOT IN
    ('Departments', 'Instructors', 'Students', 'Courses', 'Enrollments', 'SemesterFees')
ORDER BY name;
GO

-- The objects that are meant to still be here: the functions,
-- procedures and views built in Weeks 6 and 7.
SELECT
    name AS ObjectName,
    type_desc AS ObjectType
FROM sys.objects
WHERE type IN ('FN', 'IF', 'TF', 'P', 'V')
  AND is_ms_shipped = 0
ORDER BY type_desc, name;
GO

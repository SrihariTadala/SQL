/* Week 2 - Example of a table that breaks 2NF */

USE UniversityDB;
GO

DROP TABLE IF EXISTS Bad2NF;
GO

CREATE TABLE Bad2NF
(
    StudentID   INT,
    CourseCode  VARCHAR(10),
    Grade       CHAR(2),
    StudentName VARCHAR(50),
    CourseName  VARCHAR(80)
);
GO

INSERT INTO Bad2NF VALUES
    (1, 'CS101', 'A ', 'Aaron Mitchell', 'Introduction to Programming'),
    (1, 'EN101', 'B+', 'Aaron Mitchell', 'Composition I'),
    (1, 'CS201', 'A ', 'Aaron Mitchell', 'Data Structures'),
    (2, 'CS101', 'B ', 'Bianca Torres',  'Introduction to Programming'),
    (2, 'EN101', 'A-', 'Bianca Torres',  'Composition I');
GO

SELECT * FROM Bad2NF;
GO

SELECT StudentID, StudentName, COUNT(*) AS TimesRepeated
FROM Bad2NF
GROUP BY StudentID, StudentName;
GO

DROP TABLE IF EXISTS Bad2NF;
GO

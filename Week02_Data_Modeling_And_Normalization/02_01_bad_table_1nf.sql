/* Week 2 - Example of a table that breaks 1NF */

USE UniversityDB;
GO

DROP TABLE IF EXISTS BadTable;
GO

CREATE TABLE BadTable
(
    StudentID   INT,
    StudentName VARCHAR(50),
    Courses     VARCHAR(100)
);
GO

INSERT INTO BadTable VALUES
    (1, 'Aaron Mitchell', 'CS101, EN101, CS201'),
    (2, 'Bianca Torres',  'CS101, EN101'),
    (3, 'Caleb Nguyen',   'CS101, EN101, CS201');
GO

SELECT * FROM BadTable;
GO

DROP TABLE IF EXISTS BadTable;
GO

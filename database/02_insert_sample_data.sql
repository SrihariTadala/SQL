/* ==================================================================
   02_insert_sample_data.sql
   Loads the practice data into UniversityDB.

   Row counts:
       Departments      6
       Instructors     12
       Students        40
       Courses         20
       Enrollments    150
       SemesterFees    80

   Deliberate features in this data, used by later weeks:
     - Course 20 (BI301) has NO instructor        -> LEFT JOIN / NULL practice
     - Instructor 12 teaches NO course            -> RIGHT / FULL OUTER JOIN practice
     - Students 27 and 38 have NULL City / State  -> ISNULL and COALESCE practice
     - Fall 2024 enrolments are ungraded (NULL)   -> NULL vs zero practice
     - Courses form prerequisite chains up to 4 levels deep -> recursion (Week 7)

   Rows are inserted parent-first so that every foreign key already has
   the row it points at. Insert them in any other order and SQL Server
   will reject them - which is referential integrity doing its job.
   ================================================================== */

USE UniversityDB;
GO

-- Empty the tables child-first, in case this script is being re-run.
DELETE FROM Enrollments;
DELETE FROM SemesterFees;
DELETE FROM Courses;
DELETE FROM Students;
DELETE FROM Instructors;
DELETE FROM Departments;
GO


/* ---------- Departments (6 rows) ---------------------------------- */
INSERT INTO Departments (DepartmentID, DepartmentName, Building, EstablishedYear)
VALUES
    (1, 'Computer Science',        'Ada Hall',     1985),
    (2, 'Mathematics',             'Euler Hall',   1962),
    (3, 'Physics',                 'Newton Hall',  1958),
    (4, 'Business Administration', 'Keynes Hall',  1974),
    (5, 'English Literature',      'Austen Hall',  1949),
    (6, 'Biology',                 'Darwin Hall',  1968);
GO


/* ---------- Instructors (12 rows, two per department) -------------- */
INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES
    ( 1, 'Rebecca', 'Alvarez',  'r.alvarez@university.edu',  1, '2012-08-15',  92000.00),
    ( 2, 'Daniel',  'Okafor',   'd.okafor@university.edu',   1, '2016-01-10',  84500.00),
    ( 3, 'Priya',   'Raman',    'p.raman@university.edu',    2, '2009-09-01',  88000.00),
    ( 4, 'Thomas',  'Fletcher', 't.fletcher@university.edu', 2, '2018-08-20',  76000.00),
    ( 5, 'Elena',   'Duarte',   'e.duarte@university.edu',   3, '2011-03-14',  90500.00),
    ( 6, 'Marcus',  'Webb',     'm.webb@university.edu',     3, '2019-08-19',  72000.00),
    ( 7, 'Sofia',   'Bianchi',  's.bianchi@university.edu',  4, '2014-07-07',  95000.00),
    ( 8, 'Henry',   'Lockwood', 'h.lockwood@university.edu', 4, '2020-01-13',  70000.00),
    ( 9, 'Grace',   'Mbeki',    'g.mbeki@university.edu',    5, '2008-08-25',  81000.00),
    (10, 'Owen',    'Sinclair', 'o.sinclair@university.edu', 5, '2017-08-21',  69000.00),
    (11, 'Aisha',   'Karim',    'a.karim@university.edu',    6, '2013-09-02',  87500.00),
    (12, 'Victor',  'Nakamura', 'v.nakamura@university.edu', 6, '2021-08-16',  68000.00);
GO


/* ---------- Students (40 rows) ------------------------------------
   Students 27 and 38 have no City or State recorded. That is not a
   mistake - it gives us real NULLs to practise with. */
INSERT INTO Students (StudentID, FirstName, LastName, Email, DateOfBirth, EnrollmentDate, DepartmentID, City, State)
VALUES
    -- Computer Science majors
    ( 1, 'Aaron',    'Mitchell',    'aaron.mitchell@student.edu',    '2004-03-12', '2022-08-22', 1, 'Austin',         'TX'),
    ( 2, 'Bianca',   'Torres',      'bianca.torres@student.edu',     '2003-11-05', '2022-08-22', 1, 'Dallas',         'TX'),
    ( 3, 'Caleb',    'Nguyen',      'caleb.nguyen@student.edu',      '2004-07-19', '2022-08-22', 1, 'San Jose',       'CA'),
    ( 4, 'Dana',     'Whitfield',   'dana.whitfield@student.edu',    '2003-05-30', '2022-08-22', 1, 'Phoenix',        'AZ'),
    ( 5, 'Ethan',    'Brooks',      'ethan.brooks@student.edu',      '2004-01-24', '2023-01-09', 1, 'Denver',         'CO'),
    ( 6, 'Farah',    'Siddiqui',    'farah.siddiqui@student.edu',    '2004-09-08', '2023-01-09', 1, 'Chicago',        'IL'),
    ( 7, 'Gavin',    'Porter',      'gavin.porter@student.edu',      '2003-12-15', '2022-08-22', 1, 'Seattle',        'WA'),
    ( 8, 'Hana',     'Yamamoto',    'hana.yamamoto@student.edu',     '2004-04-02', '2023-01-09', 1, 'Portland',       'OR'),
    -- Mathematics majors
    ( 9, 'Isaac',    'Levine',      'isaac.levine@student.edu',      '2003-08-17', '2022-08-22', 2, 'Boston',         'MA'),
    (10, 'Julia',    'Ferreira',    'julia.ferreira@student.edu',    '2004-02-28', '2022-08-22', 2, 'Miami',          'FL'),
    (11, 'Kevin',    'Osei',        'kevin.osei@student.edu',        '2003-10-11', '2022-08-22', 2, 'Atlanta',        'GA'),
    (12, 'Laila',    'Haddad',      'laila.haddad@student.edu',      '2004-06-23', '2023-01-09', 2, 'Detroit',        'MI'),
    (13, 'Miguel',   'Santos',      'miguel.santos@student.edu',     '2003-04-09', '2022-08-22', 2, 'San Antonio',    'TX'),
    (14, 'Nina',     'Kowalski',    'nina.kowalski@student.edu',     '2004-05-14', '2022-08-22', 2, 'Cleveland',      'OH'),
    (15, 'Oscar',    'Delgado',     'oscar.delgado@student.edu',     '2004-08-30', '2023-01-09', 2, 'Albuquerque',    'NM'),
    -- Physics majors
    (16, 'Priya',    'Chandra',     'priya.chandra@student.edu',     '2003-09-21', '2022-08-22', 3, 'Raleigh',        'NC'),
    (17, 'Quentin',  'Baptiste',    'quentin.baptiste@student.edu',  '2004-03-03', '2022-08-22', 3, 'New Orleans',    'LA'),
    (18, 'Rachel',   'Kim',         'rachel.kim@student.edu',        '2003-12-07', '2022-08-22', 3, 'Baltimore',      'MD'),
    (19, 'Samuel',   'Adeyemi',     'samuel.adeyemi@student.edu',    '2004-10-16', '2023-01-09', 3, 'Houston',        'TX'),
    (20, 'Tanya',    'Petrova',     'tanya.petrova@student.edu',     '2003-06-25', '2022-08-22', 3, 'Pittsburgh',     'PA'),
    (21, 'Umar',     'Farooq',      'umar.farooq@student.edu',       '2004-01-31', '2023-01-09', 3, 'Columbus',       'OH'),
    -- Business Administration majors
    (22, 'Victoria', 'Hale',        'victoria.hale@student.edu',     '2003-07-12', '2022-08-22', 4, 'New York',       'NY'),
    (23, 'William',  'Okonkwo',     'william.okonkwo@student.edu',   '2004-04-27', '2022-08-22', 4, 'Newark',         'NJ'),
    (24, 'Ximena',   'Rojas',       'ximena.rojas@student.edu',      '2003-11-19', '2022-08-22', 4, 'Los Angeles',    'CA'),
    (25, 'Yusuf',    'Rahman',      'yusuf.rahman@student.edu',      '2004-02-06', '2023-01-09', 4, 'Minneapolis',    'MN'),
    (26, 'Zoe',      'Callahan',    'zoe.callahan@student.edu',      '2003-05-08', '2022-08-22', 4, 'Tampa',          'FL'),
    (27, 'Adrian',   'Kovac',       'adrian.kovac@student.edu',      '2004-09-29', '2023-01-09', 4, NULL,             NULL),
    (28, 'Brooke',   'Ellison',     'brooke.ellison@student.edu',    '2003-08-04', '2022-08-22', 4, 'Nashville',      'TN'),
    -- English Literature majors
    (29, 'Colin',    'Murphy',      'colin.murphy@student.edu',      '2003-10-22', '2022-08-22', 5, 'Philadelphia',   'PA'),
    (30, 'Delia',    'Vasquez',     'delia.vasquez@student.edu',     '2004-06-13', '2022-08-22', 5, 'Sacramento',     'CA'),
    (31, 'Elias',    'Wagner',      'elias.wagner@student.edu',      '2003-03-26', '2022-08-22', 5, 'St. Louis',      'MO'),
    (32, 'Fiona',    'Gallagher',   'fiona.gallagher@student.edu',   '2004-11-09', '2023-01-09', 5, 'Boise',          'ID'),
    (33, 'Gregory',  'Lin',         'gregory.lin@student.edu',       '2003-09-02', '2022-08-22', 5, 'Salt Lake City', 'UT'),
    (34, 'Halima',   'Yusuf',       'halima.yusuf@student.edu',      '2004-05-18', '2023-01-09', 5, 'Omaha',          'NE'),
    -- Biology majors
    (35, 'Ian',      'Castellanos', 'ian.castellanos@student.edu',   '2003-12-30', '2022-08-22', 6, 'Tucson',         'AZ'),
    (36, 'Jasmine',  'Boateng',     'jasmine.boateng@student.edu',   '2004-07-07', '2022-08-22', 6, 'Charlotte',      'NC'),
    (37, 'Kyle',     'Andersen',    'kyle.andersen@student.edu',     '2003-04-15', '2022-08-22', 6, 'Madison',        'WI'),
    (38, 'Lena',     'Petrosyan',   'lena.petrosyan@student.edu',    '2004-08-11', '2023-01-09', 6, NULL,             NULL),
    (39, 'Mateo',    'Rivera',      'mateo.rivera@student.edu',      '2003-06-01', '2022-08-22', 6, 'El Paso',        'TX'),
    (40, 'Nadia',    'Okoro',       'nadia.okoro@student.edu',       '2004-10-04', '2023-01-09', 6, 'Richmond',       'VA');
GO


/* ---------- Courses (20 rows) -------------------------------------
   Entry-level courses have PrerequisiteCourseID = NULL. Everything
   else points at the course that must be passed first, which builds
   chains such as:
       CS101 -> CS201 -> CS301 -> CS401
   Rows must be inserted in ID order because the prerequisite foreign
   key points at a row in this same table. */
INSERT INTO Courses (CourseID, CourseCode, CourseName, Credits, DepartmentID, InstructorID, PrerequisiteCourseID)
VALUES
    ( 1, 'CS101', 'Introduction to Programming',  4, 1,  1, NULL),
    ( 2, 'CS201', 'Data Structures',              4, 1,  1,    1),
    ( 3, 'CS301', 'Database Systems',             3, 1,  2,    2),
    ( 4, 'CS401', 'Data Warehousing',             3, 1,  2,    3),
    ( 5, 'MA101', 'College Algebra',              3, 2,  3, NULL),
    ( 6, 'MA201', 'Calculus I',                   4, 2,  3,    5),
    ( 7, 'MA202', 'Calculus II',                  4, 2,  4,    6),
    ( 8, 'MA301', 'Linear Algebra',               3, 2,  4,    6),
    ( 9, 'PH101', 'General Physics I',            4, 3,  5, NULL),
    (10, 'PH201', 'General Physics II',           4, 3,  5,    9),
    (11, 'PH301', 'Quantum Mechanics',            3, 3,  6,   10),
    (12, 'BA101', 'Principles of Management',     3, 4,  7, NULL),
    (13, 'BA201', 'Financial Accounting',         3, 4,  7,   12),
    (14, 'BA301', 'Business Analytics',           3, 4,  8,   13),
    (15, 'EN101', 'Composition I',                3, 5,  9, NULL),
    (16, 'EN201', 'World Literature',             3, 5,  9,   15),
    (17, 'EN301', 'Shakespeare Studies',          3, 5, 10,   16),
    (18, 'BI101', 'General Biology',              4, 6, 11, NULL),
    (19, 'BI201', 'Genetics',                     4, 6, 11,   18),
    -- No instructor assigned to this one yet.
    (20, 'BI301', 'Molecular Biology',            3, 6, NULL,  19);
GO


/* ---------- Enrollments (150 rows) --------------------------------
   Three terms:
       Fall 2023   (IDs   1-65)  graded
       Spring 2024 (IDs  66-120) graded
       Fall 2024   (IDs 121-150) still in progress, so Grade is NULL

   Grade point scale used:
       A = 4.00, A- = 3.70, B+ = 3.30, B = 3.00, B- = 2.70,
       C+ = 2.30, C  = 2.00, D  = 1.00, F  = 0.00                   */

-- Fall 2023
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Semester, AcademicYear, Grade, GradePoints)
VALUES
    (  1,  1,  1, 'Fall', 2023, 'A ', 4.00), (  2,  1, 15, 'Fall', 2023, 'B+', 3.30),
    (  3,  2,  1, 'Fall', 2023, 'B ', 3.00), (  4,  2, 15, 'Fall', 2023, 'A-', 3.70),
    (  5,  3,  1, 'Fall', 2023, 'A-', 3.70), (  6,  3, 15, 'Fall', 2023, 'B ', 3.00),
    (  7,  4,  1, 'Fall', 2023, 'C+', 2.30), (  8,  4, 15, 'Fall', 2023, 'B-', 2.70),
    (  9,  5,  1, 'Fall', 2023, 'B+', 3.30), ( 10,  5, 15, 'Fall', 2023, 'A ', 4.00),
    ( 11,  6,  1, 'Fall', 2023, 'B ', 3.00), ( 12,  6, 15, 'Fall', 2023, 'C ', 2.00),
    ( 13,  7,  1, 'Fall', 2023, 'A ', 4.00), ( 14,  7, 15, 'Fall', 2023, 'A ', 4.00),
    ( 15,  8,  1, 'Fall', 2023, 'D ', 1.00), ( 16,  8, 15, 'Fall', 2023, 'C+', 2.30),
    ( 17,  9,  5, 'Fall', 2023, 'A ', 4.00), ( 18,  9, 15, 'Fall', 2023, 'B+', 3.30),
    ( 19, 10,  5, 'Fall', 2023, 'B ', 3.00), ( 20, 10, 15, 'Fall', 2023, 'B ', 3.00),
    ( 21, 11,  5, 'Fall', 2023, 'A-', 3.70), ( 22, 11, 15, 'Fall', 2023, 'A-', 3.70),
    ( 23, 12,  5, 'Fall', 2023, 'C ', 2.00), ( 24, 12, 15, 'Fall', 2023, 'C+', 2.30),
    ( 25, 13,  5, 'Fall', 2023, 'B+', 3.30), ( 26, 13, 15, 'Fall', 2023, 'B-', 2.70),
    ( 27, 14,  5, 'Fall', 2023, 'A ', 4.00), ( 28, 14, 15, 'Fall', 2023, 'A-', 3.70),
    ( 29, 15,  5, 'Fall', 2023, 'B-', 2.70), ( 30, 15, 15, 'Fall', 2023, 'B ', 3.00),
    ( 31, 16,  9, 'Fall', 2023, 'A-', 3.70), ( 32, 16,  5, 'Fall', 2023, 'B+', 3.30),
    ( 33, 17,  9, 'Fall', 2023, 'B ', 3.00), ( 34, 17,  5, 'Fall', 2023, 'B ', 3.00),
    ( 35, 18,  9, 'Fall', 2023, 'A ', 4.00), ( 36, 18,  5, 'Fall', 2023, 'A ', 4.00),
    ( 37, 19,  9, 'Fall', 2023, 'C+', 2.30), ( 38, 19,  5, 'Fall', 2023, 'C ', 2.00),
    ( 39, 20,  9, 'Fall', 2023, 'B+', 3.30), ( 40, 20,  5, 'Fall', 2023, 'B-', 2.70),
    ( 41, 21,  9, 'Fall', 2023, 'B ', 3.00), ( 42, 21,  5, 'Fall', 2023, 'A-', 3.70),
    ( 43, 22, 12, 'Fall', 2023, 'A ', 4.00), ( 44, 22, 15, 'Fall', 2023, 'B+', 3.30),
    ( 45, 23, 12, 'Fall', 2023, 'B ', 3.00), ( 46, 23, 15, 'Fall', 2023, 'B ', 3.00),
    ( 47, 24, 12, 'Fall', 2023, 'A-', 3.70), ( 48, 24, 15, 'Fall', 2023, 'A ', 4.00),
    ( 49, 25, 12, 'Fall', 2023, 'C ', 2.00), ( 50, 25, 15, 'Fall', 2023, 'C+', 2.30),
    ( 51, 26, 12, 'Fall', 2023, 'B+', 3.30), ( 52, 27, 12, 'Fall', 2023, 'B-', 2.70),
    ( 53, 28, 12, 'Fall', 2023, 'A ', 4.00), ( 54, 29, 15, 'Fall', 2023, 'A ', 4.00),
    ( 55, 30, 15, 'Fall', 2023, 'B+', 3.30), ( 56, 31, 15, 'Fall', 2023, 'A-', 3.70),
    ( 57, 32, 15, 'Fall', 2023, 'B ', 3.00), ( 58, 33, 15, 'Fall', 2023, 'C+', 2.30),
    ( 59, 34, 15, 'Fall', 2023, 'B+', 3.30), ( 60, 35, 18, 'Fall', 2023, 'A ', 4.00),
    ( 61, 36, 18, 'Fall', 2023, 'B ', 3.00), ( 62, 37, 18, 'Fall', 2023, 'A-', 3.70),
    ( 63, 38, 18, 'Fall', 2023, 'C ', 2.00), ( 64, 39, 18, 'Fall', 2023, 'B+', 3.30),
    ( 65, 40, 18, 'Fall', 2023, 'B-', 2.70);
GO

-- Spring 2024
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Semester, AcademicYear, Grade, GradePoints)
VALUES
    ( 66,  1,  2, 'Spring', 2024, 'A ', 4.00), ( 67,  1,  5, 'Spring', 2024, 'A-', 3.70),
    ( 68,  2,  2, 'Spring', 2024, 'B+', 3.30), ( 69,  2,  5, 'Spring', 2024, 'B ', 3.00),
    ( 70,  3,  2, 'Spring', 2024, 'A ', 4.00), ( 71,  3,  5, 'Spring', 2024, 'B+', 3.30),
    ( 72,  4,  2, 'Spring', 2024, 'C+', 2.30), ( 73,  5,  2, 'Spring', 2024, 'B ', 3.00),
    ( 74,  5,  5, 'Spring', 2024, 'A ', 4.00), ( 75,  6,  2, 'Spring', 2024, 'B-', 2.70),
    ( 76,  7,  2, 'Spring', 2024, 'A ', 4.00), ( 77,  7,  5, 'Spring', 2024, 'A ', 4.00),
    ( 78,  8,  2, 'Spring', 2024, 'D ', 1.00), ( 79,  9,  6, 'Spring', 2024, 'A-', 3.70),
    ( 80, 10,  6, 'Spring', 2024, 'B ', 3.00), ( 81, 11,  6, 'Spring', 2024, 'A ', 4.00),
    ( 82, 12,  6, 'Spring', 2024, 'C+', 2.30), ( 83, 13,  6, 'Spring', 2024, 'B+', 3.30),
    ( 84, 14,  6, 'Spring', 2024, 'A ', 4.00), ( 85, 15,  6, 'Spring', 2024, 'C ', 2.00),
    ( 86, 16, 10, 'Spring', 2024, 'B+', 3.30), ( 87, 17, 10, 'Spring', 2024, 'B ', 3.00),
    ( 88, 18, 10, 'Spring', 2024, 'A ', 4.00), ( 89, 19, 10, 'Spring', 2024, 'C ', 2.00),
    ( 90, 20, 10, 'Spring', 2024, 'B ', 3.00), ( 91, 21, 10, 'Spring', 2024, 'A-', 3.70),
    ( 92, 22, 13, 'Spring', 2024, 'A ', 4.00), ( 93, 23, 13, 'Spring', 2024, 'B ', 3.00),
    ( 94, 24, 13, 'Spring', 2024, 'A-', 3.70), ( 95, 25, 13, 'Spring', 2024, 'C+', 2.30),
    ( 96, 26, 13, 'Spring', 2024, 'B+', 3.30), ( 97, 27, 13, 'Spring', 2024, 'B-', 2.70),
    ( 98, 28, 13, 'Spring', 2024, 'A ', 4.00), ( 99, 29, 16, 'Spring', 2024, 'A ', 4.00),
    (100, 30, 16, 'Spring', 2024, 'B+', 3.30), (101, 31, 16, 'Spring', 2024, 'A-', 3.70),
    (102, 32, 16, 'Spring', 2024, 'B ', 3.00), (103, 33, 16, 'Spring', 2024, 'C+', 2.30),
    (104, 34, 16, 'Spring', 2024, 'B+', 3.30), (105, 35, 19, 'Spring', 2024, 'A ', 4.00),
    (106, 36, 19, 'Spring', 2024, 'B ', 3.00), (107, 37, 19, 'Spring', 2024, 'A-', 3.70),
    (108, 38, 19, 'Spring', 2024, 'C ', 2.00), (109, 39, 19, 'Spring', 2024, 'B+', 3.30),
    (110, 40, 19, 'Spring', 2024, 'B-', 2.70), (111, 29,  5, 'Spring', 2024, 'B ', 3.00),
    (112, 30,  5, 'Spring', 2024, 'C+', 2.30), (113, 31,  5, 'Spring', 2024, 'B+', 3.30),
    (114, 35,  5, 'Spring', 2024, 'A-', 3.70), (115, 36,  5, 'Spring', 2024, 'B ', 3.00),
    (116, 16, 15, 'Spring', 2024, 'A ', 4.00), (117, 17, 15, 'Spring', 2024, 'B+', 3.30),
    (118, 22,  5, 'Spring', 2024, 'B ', 3.00), (119, 23,  5, 'Spring', 2024, 'C+', 2.30),
    (120, 24,  5, 'Spring', 2024, 'A-', 3.70);
GO

-- Fall 2024: term still in progress, so no grade has been awarded yet.
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Semester, AcademicYear, Grade, GradePoints)
VALUES
    (121,  1,  3, 'Fall', 2024, NULL, NULL), (122,  2,  3, 'Fall', 2024, NULL, NULL),
    (123,  3,  3, 'Fall', 2024, NULL, NULL), (124,  5,  3, 'Fall', 2024, NULL, NULL),
    (125,  7,  3, 'Fall', 2024, NULL, NULL), (126,  1,  4, 'Fall', 2024, NULL, NULL),
    (127,  3,  4, 'Fall', 2024, NULL, NULL), (128,  7,  4, 'Fall', 2024, NULL, NULL),
    (129,  9,  7, 'Fall', 2024, NULL, NULL), (130, 10,  7, 'Fall', 2024, NULL, NULL),
    (131, 11,  7, 'Fall', 2024, NULL, NULL), (132,  9,  8, 'Fall', 2024, NULL, NULL),
    (133, 11,  8, 'Fall', 2024, NULL, NULL), (134, 14,  7, 'Fall', 2024, NULL, NULL),
    (135, 16, 11, 'Fall', 2024, NULL, NULL), (136, 18, 11, 'Fall', 2024, NULL, NULL),
    (137, 21, 11, 'Fall', 2024, NULL, NULL), (138, 22, 14, 'Fall', 2024, NULL, NULL),
    (139, 24, 14, 'Fall', 2024, NULL, NULL), (140, 26, 14, 'Fall', 2024, NULL, NULL),
    (141, 28, 14, 'Fall', 2024, NULL, NULL), (142, 29, 17, 'Fall', 2024, NULL, NULL),
    (143, 31, 17, 'Fall', 2024, NULL, NULL), (144, 34, 17, 'Fall', 2024, NULL, NULL),
    (145, 35, 20, 'Fall', 2024, NULL, NULL), (146, 37, 20, 'Fall', 2024, NULL, NULL),
    (147, 39, 20, 'Fall', 2024, NULL, NULL), (148, 36, 20, 'Fall', 2024, NULL, NULL),
    (149, 40, 20, 'Fall', 2024, NULL, NULL), (150, 38, 20, 'Fall', 2024, NULL, NULL);
GO


/* ---------- SemesterFees (80 rows) --------------------------------
   One row per student per term for the two completed terms.
   Where AmountPaid is less than AmountDue the student still owes
   money, which gives Week 4 and Week 5 something worth calculating. */

-- Fall 2023 fees, due 15 September 2023
INSERT INTO SemesterFees (FeeID, StudentID, Semester, AcademicYear, AmountDue, AmountPaid, DueDate)
VALUES
    ( 1,  1, 'Fall', 2023, 4800.00, 4800.00, '2023-09-15'),
    ( 2,  2, 'Fall', 2023, 4800.00, 4800.00, '2023-09-15'),
    ( 3,  3, 'Fall', 2023, 4800.00, 3600.00, '2023-09-15'),
    ( 4,  4, 'Fall', 2023, 4800.00, 4800.00, '2023-09-15'),
    ( 5,  5, 'Fall', 2023, 4800.00, 2400.00, '2023-09-15'),
    ( 6,  6, 'Fall', 2023, 4800.00, 4800.00, '2023-09-15'),
    ( 7,  7, 'Fall', 2023, 4800.00, 4800.00, '2023-09-15'),
    ( 8,  8, 'Fall', 2023, 4800.00, 1200.00, '2023-09-15'),
    ( 9,  9, 'Fall', 2023, 4200.00, 4200.00, '2023-09-15'),
    (10, 10, 'Fall', 2023, 4200.00, 4200.00, '2023-09-15'),
    (11, 11, 'Fall', 2023, 4200.00, 4200.00, '2023-09-15'),
    (12, 12, 'Fall', 2023, 4200.00, 2100.00, '2023-09-15'),
    (13, 13, 'Fall', 2023, 4200.00, 4200.00, '2023-09-15'),
    (14, 14, 'Fall', 2023, 4200.00, 4200.00, '2023-09-15'),
    (15, 15, 'Fall', 2023, 4200.00, 3150.00, '2023-09-15'),
    (16, 16, 'Fall', 2023, 5100.00, 5100.00, '2023-09-15'),
    (17, 17, 'Fall', 2023, 5100.00, 5100.00, '2023-09-15'),
    (18, 18, 'Fall', 2023, 5100.00, 5100.00, '2023-09-15'),
    (19, 19, 'Fall', 2023, 5100.00, 2550.00, '2023-09-15'),
    (20, 20, 'Fall', 2023, 5100.00, 5100.00, '2023-09-15'),
    (21, 21, 'Fall', 2023, 5100.00, 5100.00, '2023-09-15'),
    (22, 22, 'Fall', 2023, 5800.00, 5800.00, '2023-09-15'),
    (23, 23, 'Fall', 2023, 5800.00, 5800.00, '2023-09-15'),
    (24, 24, 'Fall', 2023, 5800.00, 4350.00, '2023-09-15'),
    (25, 25, 'Fall', 2023, 5800.00, 5800.00, '2023-09-15'),
    (26, 26, 'Fall', 2023, 5800.00, 5800.00, '2023-09-15'),
    (27, 27, 'Fall', 2023, 5800.00,    0.00, '2023-09-15'),
    (28, 28, 'Fall', 2023, 5800.00, 5800.00, '2023-09-15'),
    (29, 29, 'Fall', 2023, 3900.00, 3900.00, '2023-09-15'),
    (30, 30, 'Fall', 2023, 3900.00, 3900.00, '2023-09-15'),
    (31, 31, 'Fall', 2023, 3900.00, 3900.00, '2023-09-15'),
    (32, 32, 'Fall', 2023, 3900.00, 1950.00, '2023-09-15'),
    (33, 33, 'Fall', 2023, 3900.00, 3900.00, '2023-09-15'),
    (34, 34, 'Fall', 2023, 3900.00, 3900.00, '2023-09-15'),
    (35, 35, 'Fall', 2023, 5400.00, 5400.00, '2023-09-15'),
    (36, 36, 'Fall', 2023, 5400.00, 5400.00, '2023-09-15'),
    (37, 37, 'Fall', 2023, 5400.00, 4050.00, '2023-09-15'),
    (38, 38, 'Fall', 2023, 5400.00, 5400.00, '2023-09-15'),
    (39, 39, 'Fall', 2023, 5400.00, 5400.00, '2023-09-15'),
    (40, 40, 'Fall', 2023, 5400.00, 2700.00, '2023-09-15');
GO

-- Spring 2024 fees, due 15 February 2024
INSERT INTO SemesterFees (FeeID, StudentID, Semester, AcademicYear, AmountDue, AmountPaid, DueDate)
VALUES
    (41,  1, 'Spring', 2024, 4950.00, 4950.00, '2024-02-15'),
    (42,  2, 'Spring', 2024, 4950.00, 4950.00, '2024-02-15'),
    (43,  3, 'Spring', 2024, 4950.00, 4950.00, '2024-02-15'),
    (44,  4, 'Spring', 2024, 4950.00, 3300.00, '2024-02-15'),
    (45,  5, 'Spring', 2024, 4950.00, 4950.00, '2024-02-15'),
    (46,  6, 'Spring', 2024, 4950.00, 4950.00, '2024-02-15'),
    (47,  7, 'Spring', 2024, 4950.00, 4950.00, '2024-02-15'),
    (48,  8, 'Spring', 2024, 4950.00, 2475.00, '2024-02-15'),
    (49,  9, 'Spring', 2024, 4350.00, 4350.00, '2024-02-15'),
    (50, 10, 'Spring', 2024, 4350.00, 4350.00, '2024-02-15'),
    (51, 11, 'Spring', 2024, 4350.00, 4350.00, '2024-02-15'),
    (52, 12, 'Spring', 2024, 4350.00, 4350.00, '2024-02-15'),
    (53, 13, 'Spring', 2024, 4350.00, 2900.00, '2024-02-15'),
    (54, 14, 'Spring', 2024, 4350.00, 4350.00, '2024-02-15'),
    (55, 15, 'Spring', 2024, 4350.00, 4350.00, '2024-02-15'),
    (56, 16, 'Spring', 2024, 5250.00, 5250.00, '2024-02-15'),
    (57, 17, 'Spring', 2024, 5250.00, 5250.00, '2024-02-15'),
    (58, 18, 'Spring', 2024, 5250.00, 5250.00, '2024-02-15'),
    (59, 19, 'Spring', 2024, 5250.00, 5250.00, '2024-02-15'),
    (60, 20, 'Spring', 2024, 5250.00, 3500.00, '2024-02-15'),
    (61, 21, 'Spring', 2024, 5250.00, 5250.00, '2024-02-15'),
    (62, 22, 'Spring', 2024, 5950.00, 5950.00, '2024-02-15'),
    (63, 23, 'Spring', 2024, 5950.00, 5950.00, '2024-02-15'),
    (64, 24, 'Spring', 2024, 5950.00, 5950.00, '2024-02-15'),
    (65, 25, 'Spring', 2024, 5950.00, 2975.00, '2024-02-15'),
    (66, 26, 'Spring', 2024, 5950.00, 5950.00, '2024-02-15'),
    (67, 27, 'Spring', 2024, 5950.00, 1500.00, '2024-02-15'),
    (68, 28, 'Spring', 2024, 5950.00, 5950.00, '2024-02-15'),
    (69, 29, 'Spring', 2024, 4050.00, 4050.00, '2024-02-15'),
    (70, 30, 'Spring', 2024, 4050.00, 4050.00, '2024-02-15'),
    (71, 31, 'Spring', 2024, 4050.00, 4050.00, '2024-02-15'),
    (72, 32, 'Spring', 2024, 4050.00, 4050.00, '2024-02-15'),
    (73, 33, 'Spring', 2024, 4050.00, 2025.00, '2024-02-15'),
    (74, 34, 'Spring', 2024, 4050.00, 4050.00, '2024-02-15'),
    (75, 35, 'Spring', 2024, 5550.00, 5550.00, '2024-02-15'),
    (76, 36, 'Spring', 2024, 5550.00, 5550.00, '2024-02-15'),
    (77, 37, 'Spring', 2024, 5550.00, 5550.00, '2024-02-15'),
    (78, 38, 'Spring', 2024, 5550.00, 3700.00, '2024-02-15'),
    (79, 39, 'Spring', 2024, 5550.00, 5550.00, '2024-02-15'),
    (80, 40, 'Spring', 2024, 5550.00, 5550.00, '2024-02-15');
GO


/* ---------- Report what was loaded -------------------------------- */
SELECT 'Departments'  AS TableName, COUNT(*) AS RowsLoaded FROM Departments
UNION ALL SELECT 'Instructors',  COUNT(*) FROM Instructors
UNION ALL SELECT 'Students',     COUNT(*) FROM Students
UNION ALL SELECT 'Courses',      COUNT(*) FROM Courses
UNION ALL SELECT 'Enrollments',  COUNT(*) FROM Enrollments
UNION ALL SELECT 'SemesterFees', COUNT(*) FROM SemesterFees;
GO

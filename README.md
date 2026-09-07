# UniversityDB – SQL Training Project

SQL Server  queries built around a university database with **Students**, **Departments**, **Instructors**, **Courses**, **Enrollments** and **SemesterFees** tables.

## Database Setup

Run the scripts in `database/` in order:

1. `00_create_database.sql` – creates the UniversityDB database
2. `01_create_tables.sql` – creates all six tables with keys and constraints
3. `02_insert_sample_data.sql` – inserts 40 students, 6 departments, 12 instructors, 20 courses, 150 enrollments and semester fee records
4. `03_verify_data.sql` – quick row counts to confirm everything loaded

The `database/dataset/` folder contains the same sample data exported as CSV files.

## Weekly Scripts

| Folder | Topic | What's Covered |
|--------|-------|----------------|
| `Week01_Data_Warehousing_Basics` | Exploring tables | SELECT, TOP, COUNT, COUNT DISTINCT |
| `Week02_Data_Modeling_And_Normalization` | Normalization | 1NF/2NF examples, relationships, foreign keys |
| `Week03_SQL_Server_And_SELECT` | SELECT fundamentals | Column selection, aliases, calculated columns |
| `Week04_Filtering_And_Functions` | Filtering & functions | WHERE, IN, LIKE, DISTINCT, ORDER BY, string functions, CASE |
| `Week05_Aggregates_And_Joins` | Aggregates & joins | COUNT, SUM, AVG, GROUP BY, HAVING, INNER/LEFT JOIN |
| `Week06_Functions_Procedures_Pivot` | Programmability | Scalar function, stored procedure, PIVOT, UNPIVOT |
| `Week07_Hierarchies_Triggers_Views` | Views & triggers | Self-join, CREATE VIEW, audit trigger |

## Environment

- SQL Server 2022 Developer Edition
- Tested with `sqlcmd` and Azure Data Studio

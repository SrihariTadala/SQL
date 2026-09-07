/* ==================================================================
   00_create_database.sql
   Creates the UniversityDB practice database.

   This is the database used by every query in Weeks 1-7 of this
   training portfolio. It is deliberately small: six tables and a few
   hundred rows, so that every result set can be checked by eye.

   Safe to re-run: the database is dropped first if it already exists.
   ================================================================== */

-- @database: master
USE master;
GO

/* If a previous practice session left the database behind, close any
   open connections and drop it so we start from a clean slate.
   SINGLE_USER WITH ROLLBACK IMMEDIATE kicks out other sessions. */
IF DB_ID('UniversityDB') IS NOT NULL
BEGIN
    ALTER DATABASE UniversityDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE UniversityDB;
END
GO

-- Create the database using the server's default file locations and sizes.
CREATE DATABASE UniversityDB;
GO

-- Confirm the database now exists and report its details.
SELECT
    name              AS DatabaseName,
    database_id       AS DatabaseID,
    state_desc        AS State,
    recovery_model_desc AS RecoveryModel,
    collation_name    AS Collation
FROM sys.databases
WHERE name = 'UniversityDB';
GO

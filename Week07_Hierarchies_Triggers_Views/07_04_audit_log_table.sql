/* Week 7 - Create an audit log table */

USE UniversityDB;
GO

DROP TABLE IF EXISTS EnrollmentLog;
GO

CREATE TABLE EnrollmentLog
(
    LogID        INT IDENTITY(1,1) PRIMARY KEY,
    EnrollmentID INT,
    Action       VARCHAR(10),
    ActionDate   DATETIME DEFAULT GETDATE(),
    ActionUser   VARCHAR(100) DEFAULT SYSTEM_USER
);
GO

SELECT * FROM EnrollmentLog;
GO

-- =============================================
-- Author:		Nikhil
-- Create date: 05-02-2026
-- Description:	Sample Trigger
-- =============================================
Drop TRIGGER Trigg_On_Insert_Customer
DISABLE TRIGGER Trigger_On_Insert_Customer ON sales.customers;


CREATE TRIGGER Trigg_On_Insert_Customer
ON sales.customers
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.loginfo (Id, Logtext)
    SELECT 
        NEWID(),
        first_name + ' ' + last_name + ' Added'
    FROM inserted;

-- Trigger  Creation
CREATE Trigger Trigge_On_Insert_Customer
ON sales.customers
AFTER INSERT 
AS 
BEGIN

SET NOCOUNT ON;
DECLARE @Name VARCHAR(100);
SET @Name = (SELECT first_name FROM inserted);

INSERT INTO loginfo (Id, Logtext)
VAlues (NEWID(), @Name+' Added');
END;


GO

SELECT * FROM loginfo;
SELECT * FROM sales.customers;

-- Inserting into customers to check trigger

INSERT INTO sales.customers
                         (first_name, last_name, phone, email, street, city, zip_code, state)
VALUES        ('Nikhil', 'Yadav', '238932492', 'asdas@gmasjs.com', '123', '1234', '12445', 'delhi')

-- Alter Trigger 
ALTER TRIGGER Trigg_On_Insert_Customer
ON sales.customers
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.loginfo (Id, Logtext)
    SELECT 
        NEWID(),
        first_name + ' ' + last_name + ' Added'
    FROM inserted;
END;
GO

IF OBJECT_ID('dbo.Tri_Insert_Customer', 'TR') IS NOT NULL
    DROP TRIGGER dbo.Tri_Insert_Customer;

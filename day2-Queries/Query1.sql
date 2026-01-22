use [PracticeDB]

-- Stored Procedure : stored in DB script

Create Procedure MyProcedure
-- Optional or parameters
as
Begin 

SELECT * FROM [dbo].[Customers]

End

GO --To distinguish between query

MyProcedure --once created, can call by object name




--  Procedure with Parameter

Alter Procedure MyProcedure2
@City varchar(50)  --Takes input for city
as
Begin 

SELECT * FROM [dbo].[Customers] where city = @City

End
go

MyProcedure2 'Coimbatore' --input city



-- Get CustomerByName Stored Procedure: First create procedure without exectuing and then call the procedure with input

Alter Procedure CustomerByName  -- Create Procedure first (execute till end) 
@CustomerName varchar(50)
as 

Begin 
SELECT * FROM Customers WHERE FullName = @CustomerName
END

go 

CustomerByName 'Gopi%'


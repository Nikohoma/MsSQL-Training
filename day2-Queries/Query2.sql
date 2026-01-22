-- =============================================
-- Author:		Nikhil
-- Create date: 22-01-26
-- Description:	Sample Procedure SP
-- =============================================
use PracticeDB

CREATE PROCEDURE GetCustomerByNameAndCity
	@Name varchar(50), @City varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Customers WHERE FullName = @Name AND City = @City
END
GO


GetCustomerByNameAndCity 'Gopi Suresh', 'Coimbatore'
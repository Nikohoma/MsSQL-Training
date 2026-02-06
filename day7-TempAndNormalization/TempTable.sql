
-- Temp Table : Cannot store xml columns
SELECT * INTO #temp1 FROM [Person].[Address]  --temp table
SELECT * FROM #temp1

-- Truncate table command cannot be rollback unlike Drop

-- global temp table, can be accessed by others in the same server
SELECT top 5 * INTO ##temp1 FROM [Person].[Address]  

SELECT * FROM ##temp1

SELECT uu.AddressLine1 from [Person].[Address]uu for xml auto  -- Create xml
SELECT uu.AddressLine1 from [Person].[Address]uu for json auto  -- Create json

-- stored Procedure with temp table, temp table will be dropped after the procedure execution
Create Procedure spTempTableCreate
AS
BEGIN 

SELECT top 5 * INTO ##temp1 FROM [Person].[Address]  
SELECT * INTO #temp1 FROM [Person].[Address]  

END
spTempTableCreate





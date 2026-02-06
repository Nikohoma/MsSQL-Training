SET STATISTICS IO ON  -- shows logical reads
SET STATISTICS TIME ON -- show cpu/time

-- Clustered Index : Created automatically on the primary key, determines the physical order of data in the table. Only one clustered index per table.
-- Non Clustered Index : Separate structure that contains a copy of indexed columns and a pointer to the actual data rows. Can have multiple non-clustered indexes per table.

-- Creating a new table for indexing 

USE AdventureWorks2019;
GO

DROP TABLE IF EXISTS dbo.SOH_Practice;
SELECT TOP (300000)
  SalesOrderID, CustomerID, OrderDate, SubTotal, TaxAmt, Freight, TotalDue
INTO dbo.SOH_Practice
FROM Sales.SalesOrderHeader
ORDER BY SalesOrderID;

-- Create a clustered index on SalesOrderID (common pattern)
-- This leaves our search columns (CustomerID, OrderDate) without a supporting index.
CREATE CLUSTERED INDEX CX_SOH_Practice_SalesOrderID
ON dbo.SOH_Practice(SalesOrderID);

DROP INDEX IF EXISTS CX_SOH_Practice_SalesOrderID ON dbo.SOH_Practice;


------------------------------
SELECT COUNT(*) FROM dbo.SOH_Practice

-- Without index, searching
-- Execution Time : CPU time = 15 ms,  elapsed time = 8 ms.  ; Parse and Compile Time : CPU time = 31 ms, elapsed time = 43 ms.
SELECT * FROM SOH_Practice
WHERE SalesOrderID = 50488   


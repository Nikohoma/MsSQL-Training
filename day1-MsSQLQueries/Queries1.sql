use PracticeDB

-- Queries 
select * from Customers;

-- Distinct
SELECT DISTINCT City
FROM dbo.Customers;

-- Fixed File Length Format
-- get Results in Text Format : Ctrl + t in result area
-- Ctrl + r to hide/unhide the result area

-- AS
SELECT FullName AS CustomerName, City AS CustomerCity
FROM dbo.Customers;

-- Where
Select * from Customers where city <> 'Chennai' and Segment = 'Corporate'

Select * from Customers where NOT Segment = 'Corporate'  -- Not = !

-- In
SELECT *
FROM dbo.Customers
WHERE City IN ('Chennai', 'Coimbatore');

-- Between/Range
SELECT *
FROM dbo.Orders
WHERE Amount BETWEEN 800 AND 3000;


SELECT *
FROM dbo.Orders
WHERE 800 < Amount and Amount < 3000;

-- Like
SELECT *
FROM dbo.Customers
WHERE FullName LIKE '%m%';

-- Order By
SELECT *
FROM dbo.Orders
ORDER BY OrderDate asc;

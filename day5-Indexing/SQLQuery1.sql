
SELECT * FROM Person.Person;

SELECT * into perf_issue FROM Person.Person;   -- No constraint table, No PK,FK etc.

Insert into perf_issue
SELECT * FroM Person.person

-- In SQL Server, tables are stored as pages
-- 8KB = 1 page
-- MB = pages * 8KB / 1024
-- Performance = No.Of pages , More pages more search => less performance
SET STATISTICS IO ON  -- shows logical reads
SET STATISTICS TIME ON -- show cpu/time

SELECT * FROM perf_issue

-- Little Performance increase with view. View = read only records, cannot perform much operations on view
CREATE VIEW perf_issue_vw 
as
SELECT * FROM perf_issue

SELECT * FROM perf_issue_vw

-- Indexing happens on PK(unique), Clustered index : Indexing happens automatically on PK

-- Need serial number column(PK) for indexing(used to identify rows)
SELECT 
ROW_Number() OVER (ORDER BY BusinessEntityID) as RowNum,
*
FROM perf_issue



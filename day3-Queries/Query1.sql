-- GUID unique identifier

CREATE TABLE TestTable (
    ID uniqueidentifier DEFAULT NEWID(), -- GUID
    Name nvarchar(50)
);

INSERT INTO TestTable (Name) VALUES ('Test');
SELECT * FROM TestTable;

SELECT * FROM sysobjects;   -- SQL SErver metadata in masterDB
SELECT distinct xtype FROM sysobjects;  -- Metadata about the object type. U:user tables

SELECT * FROM TestTable;

-- Groupby : only those columns should be selected which are after group by keyword
SELECT xtype, count(*) FROM sysobjects
GROUP BY xtype;

-- Having 
SELECT 
        xtype, 
        count(*) 
FROM sysobjects
GROUP BY xtype
HAVING xtype ='D';  -- equivalent to where but where is not accepted after groupby


-- INTO : Creates a new table, resource heavy
-- Groupby with where
-- worst approach because into is resource heavy
SELECT 
        xtype, 
        count(*) as ObjectCount  into t1
FROM sysobjects
GROUP BY xtype

SElect * from t1 where xtype = 'D';


-- Groupby with where : better approach

SELECT * FROM 
(SELECT 
        xtype, 
        count(*) as ObjectCount
FROM sysobjects
GROUP BY xtype) temp
WHERE temp.xtype = 'D';


-- Groupby with where : OR just use where before group by

use [AdventureWorks2025];

-- UNION : Cannot be performed with xml data columns, both table should have same columns, Does not repeat matched records like union all

SELECT TOP 15 BusinessEntityID, LastName FROM [Person].[Person]
UNION
SELECT TOP 15 BusinessEntityID, LastName FROM [Person].[Person] ORDER BY BusinessEntityID desc;

-- UNION ALL
SELECT TOP 15 BusinessEntityID, LastName FROM [Person].[Person]
UNION ALL
SELECT TOP 15 BusinessEntityID, LastName FROM [Person].[Person] ORDER BY BusinessEntityID desc;




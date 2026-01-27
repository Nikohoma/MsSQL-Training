SELECT TOP (1) [BusinessEntityID]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2025].[Person].[BusinessEntity]
  ORDER BY [BusinessEntityID] Desc;

INSERT INTO Person.BusinessEntity
                         (BusinessEntityID, rowguid, ModifiedDate)
VALUES        (1012923, 'A4C82398-7466-4FE6-B9EE-CEC38D166F60', CONVERT(DATETIME, '2026-01-02 00:00:00', 102))


use BikeStores

-- Cursor : Loops through the records, Used for batch operations, row by row processing
DECLARE @ProductId INT;
DECLARE @ProductName VARCHAR(100);
DECLARE @Price DECIMAL(10,2);

-- 1) Declare cursor
DECLARE curProducts CURSOR FAST_FORWARD
FOR
    SELECT [product_id],[product_name],[list_price]
    FROM [production].[products]
    ORDER BY [product_id];

-- 2) Open cursor
OPEN curProducts;

-- 3) Fetch first row
FETCH NEXT FROM curProducts INTO @ProductId, @ProductName, @Price;

-- 4) Loop until no more rows
WHILE @@FETCH_STATUS = 0   -- 0 if more records are available
BEGIN
    PRINT 'ProductId=' + CAST(@ProductId AS VARCHAR(10))
        + ' | Name=' + @ProductName
        + ' | Price=' + CAST(@Price AS VARCHAR(20));

    -- fetch next row
    FETCH NEXT FROM curProducts INTO @ProductId, @ProductName, @Price;
END

-- 5) Close + Deallocate
CLOSE curProducts;
DEALLOCATE curProducts;
-- Get pages of all the table

SELECT so.name,  ps.used_page_count
FROM sys.dm_db_partition_stats ps       -- from master db
inner join
sysobjects so                          -- from master db
on ps.object_id = so.id
WHERE so.xtype = 'U'
ORDER BY ps.used_page_count desc
-- Check if autovacuum is enabled
SHOW autovacuum;

-- Vacuum statistics for the "Books" table
SELECT 
    schemaname, 
    relname, 
    last_vacuum, 
    last_autovacuum, 
    vacuum_count, 
    autovacuum_count
FROM pg_stat_user_tables
WHERE relid = 16509;

-- Configure autovacuum for the "Books" table
-- Trigger vacuum when there are at least 1000 dead tuples or 1% of table rows
ALTER TABLE "Books" SET (
    autovacuum_vacuum_scale_factor = 0.01,
    autovacuum_vacuum_threshold = 1000
);



SELECT 
    query,
    shared_blks_read + shared_blks_written AS "TotalIO",
    calls
FROM pg_stat_statements
ORDER BY "TotalIO" DESC
LIMIT 10;
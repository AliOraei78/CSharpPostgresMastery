SELECT 
    query,
    calls,
    total_exec_time AS "TotalTimeMs",
    mean_exec_time AS "MeanTimeMs",
    rows,
    100.0 * shared_blks_hit / nullif(shared_blks_hit + shared_blks_read, 0) AS "HitPercent"
FROM pg_stat_statements
ORDER BY total_exec_time DESC
LIMIT 20;
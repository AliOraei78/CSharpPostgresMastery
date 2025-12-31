SELECT 
    query,
    calls,
    mean_exec_time AS "MeanTimeMs",
    total_exec_time AS "TotalTimeMs"
FROM pg_stat_statements
WHERE calls > 10 
ORDER BY mean_exec_time DESC
LIMIT 20;
-- Enable the extension
CREATE EXTENSION IF NOT EXISTS "pg_stat_statements";

-- Check if the extension is available and installed
SELECT * 
FROM pg_available_extensions 
WHERE name = 'pg_stat_statements';

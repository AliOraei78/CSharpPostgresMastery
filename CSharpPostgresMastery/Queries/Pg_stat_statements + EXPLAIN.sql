EXPLAIN (ANALYZE, BUFFERS)
SELECT
             gss_authenticated, encrypted
        FROM
            pg_catalog.pg_stat_gssapi
        WHERE pid = pg_backend_pid()


SELECT pg_stat_statements_reset();
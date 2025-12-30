-- Manual VACUUM to clean up dead tuples
VACUUM VERBOSE "Books";

-- VACUUM + ANALYZE to update statistics for the planner
VACUUM ANALYZE "Books";

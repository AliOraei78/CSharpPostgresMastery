-- Short and fast transaction
BEGIN;
-- minimal operations
COMMIT;

-- Using SAVEPOINT for partial rollback
BEGIN;
SAVEPOINT sp1;
-- operations
ROLLBACK TO SAVEPOINT sp1;
COMMIT;

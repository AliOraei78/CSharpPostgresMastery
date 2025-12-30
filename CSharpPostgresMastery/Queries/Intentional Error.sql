BEGIN;
UPDATE "BookInventory" SET "Stock" = "Stock" - 1 WHERE "BookId" = '11111111-1111-1111-1111-111111111111';
-- Wait
UPDATE "BookInventory" SET "Stock" = "Stock" - 1 WHERE "BookId" = '22222222-2222-2222-2222-222222222222';

BEGIN;

-- Transaction 1: trying to update two rows in different order
UPDATE "BookInventory"
SET "Stock" = "Stock" - 1
WHERE "BookId" = '22222222-2222-2222-2222-222222222222';

-- Wait for another transaction to release a lock
UPDATE "BookInventory"
SET "Stock" = "Stock" - 1
WHERE "BookId" = '11111111-1111-1111-1111-111111111111';

-- PostgreSQL detects a deadlock and aborts one of the transactions


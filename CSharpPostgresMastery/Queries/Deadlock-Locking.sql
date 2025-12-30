-- Row-level locking using SELECT FOR UPDATE
BEGIN;

-- Lock a specific row in BookInventory
SELECT *
FROM "BookInventory"
WHERE "BookId" = '11111111-1111-1111-1111-111111111111'
FOR UPDATE;  -- This row is now locked for this transaction

-- No other session can UPDATE this row until COMMIT
COMMIT;

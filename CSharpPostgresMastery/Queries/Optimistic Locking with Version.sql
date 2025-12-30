-- In the update, check the version
UPDATE "BookInventory"
SET "Stock" = 80, "Version" = "Version" + 1
WHERE "BookId" = '11111111-1111-1111-1111-111111111111' AND "Version" = 0;

-- If 0 rows are updated, it means a conflict (someone else has modified it)
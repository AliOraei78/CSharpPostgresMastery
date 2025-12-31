CREATE INDEX idx_books_year ON "Books" ("Year");
CREATE INDEX idx_books_price ON "Books" ("Price");

-- Before partitioning (on the old table — if it still exists)
EXPLAIN ANALYZE
SELECT COUNT(*) FROM "BooksOld" WHERE "Year" >= 2020;

-- After partitioning
EXPLAIN ANALYZE
SELECT COUNT(*) FROM "Books" WHERE "Year" >= 2020;

EXPLAIN ANALYZE
SELECT * FROM "Books" WHERE "Year" BETWEEN 1950 AND 1960;

-- Delete all books published before 1950 (only one partition is dropped — very fast!)
DROP TABLE "Books_1900_1950";

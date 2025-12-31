EXPLAIN ANALYZE
SELECT "Title", "Author"
FROM "Books"
WHERE "Properties"->>'Publisher' = 'Publisher 50';

-- GIN index on a specific key inside JSONB
CREATE INDEX idx_books_publisher ON "Books" USING GIN (("Properties" -> 'Publisher'));

-- Test again
EXPLAIN ANALYZE
SELECT "Title", "Author"
FROM "Books"
WHERE "Properties"->>'Publisher' = 'Publisher 50';

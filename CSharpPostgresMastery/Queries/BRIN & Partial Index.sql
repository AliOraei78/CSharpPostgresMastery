-- Create a BRIN index on the Year column
-- Works very well if the data is physically ordered by year
CREATE INDEX idx_books_year_brin
ON "Books"
USING BRIN ("Year");

-- Create a partial index only for expensive books (Price > 300000)
CREATE INDEX idx_books_expensive
ON "Books" ("Price")
WHERE "Price" > 300000;

-- Test
EXPLAIN ANALYZE
SELECT *
FROM "Books"
WHERE "Price" > 400000;

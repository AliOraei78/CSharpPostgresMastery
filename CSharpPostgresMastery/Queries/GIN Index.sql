-- Create a GIN index on the Properties column (for key/value search)
CREATE INDEX idx_books_properties_gin
ON "Books"
USING GIN ("Properties");

-- Test JSONB search
EXPLAIN ANALYZE
SELECT "Title", "Properties"->>'Pages' AS "Pages"
FROM "Books"
WHERE "Properties" @> '{"Language": "Persian"}';

EXPLAIN ANALYZE
SELECT "Title"
FROM "Books"
WHERE "Properties" ? 'Awards';  -- check existence of the Awards key

-- Create a GIN index on the Genres column (for array search)
CREATE INDEX idx_books_genres_gin
ON "Books"
USING GIN ("Genres");

-- Test
EXPLAIN ANALYZE
SELECT "Title", "Genres"
FROM "Books"
WHERE "Genres" @> ARRAY['Fiction'];

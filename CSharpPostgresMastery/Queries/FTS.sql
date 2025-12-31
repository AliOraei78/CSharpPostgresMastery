-- Enable pg_trgm for fuzzy search
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- Test the extension
SELECT similarity('Book Title', 'Book Ttle');  -- Output: 0.666666666666667


-- tsvector column for full-text search
ALTER TABLE "Books"
ADD COLUMN "SearchVector" TSVECTOR
GENERATED ALWAYS AS (
    to_tsvector('english', "Title" || ' ' || "Author")
) STORED;

-- GIN index on tsvector (makes searches very fast)
CREATE INDEX idx_books_search_gin ON "Books" USING GIN ("SearchVector");

-- Search for "dystopian" in the title or author
SELECT "Title", "Author"
FROM "Books"
WHERE "SearchVector" @@ to_tsquery('english', 'dystopian')
ORDER BY ts_rank("SearchVector", to_tsquery('english', 'dystopian')) DESC;

-- Search for "orwell" or "1984"
SELECT "Title", "Author", ts_rank("SearchVector", query) AS "Rank"
FROM "Books", to_tsquery('english', 'orwell | 1984') query
WHERE "SearchVector" @@ query
ORDER BY "Rank" DESC;

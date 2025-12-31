-- Weighting: Title 3x more important than Author
ALTER TABLE "Books"
DROP COLUMN "SearchVector";

ALTER TABLE "Books"
ADD COLUMN "SearchVector" TSVECTOR
GENERATED ALWAYS AS (
    setweight(to_tsvector('english', "Title"), 'A') ||
    setweight(to_tsvector('english', "Author"), 'B')
) STORED;

-- GIN index on the weighted tsvector
CREATE INDEX idx_books_search_weighted_gin ON "Books" USING GIN ("SearchVector");

SELECT "Title", "Author", ts_rank("SearchVector", query) AS "Rank"
FROM "Books", to_tsquery('english', 'orwell') query
WHERE "SearchVector" @@ query
ORDER BY "Rank" DESC;
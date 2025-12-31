-- Search for "1985" (typo — should match 1984)
SELECT "Title", "Author", similarity("Title", '1985') AS "Similarity"
FROM "Books"
WHERE similarity("Title", '1985') > 0.3
ORDER BY "Similarity" DESC;

-- Search for "George Orwel" (missing the last "l")
SELECT "Title", "Author", similarity("Author", 'George Orwel') AS "Similarity"
FROM "Books"
WHERE similarity("Author", 'George Orwel') > 0.6
ORDER BY "Similarity" DESC;

-- Trigram indexes on Title and Author
CREATE INDEX idx_books_title_trgm ON "Books" USING GIN ("Title" gin_trgm_ops);
CREATE INDEX idx_books_author_trgm ON "Books" USING GIN ("Author" gin_trgm_ops);

-- Test with the index
EXPLAIN ANALYZE
SELECT "Title", similarity("Title", '1985') AS "Similarity"
FROM "Books"
WHERE "Title" % '1985'  -- % operator for trigram similarity
ORDER BY "Similarity" DESC;

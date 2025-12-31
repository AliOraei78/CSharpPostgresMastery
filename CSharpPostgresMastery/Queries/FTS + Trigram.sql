-- Combined search: FTS + Trigram (corrected)
SELECT 
    "Title", 
    "Author",
    ts_rank("SearchVector", query) AS "TextRank",
    similarity("Title", 'orwell') AS "TitleSimilarity"  -- pass text directly
FROM "Books",
     to_tsquery('english', 'orwell | dystopian') query
WHERE "SearchVector" @@ query
  AND "Title" % 'orwell'  -- the % operator also takes plain text
ORDER BY (ts_rank("SearchVector", query) + similarity("Title", 'orwell')) DESC
LIMIT 20;

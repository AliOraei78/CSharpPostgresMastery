-- 1. Simple query without index
EXPLAIN ANALYZE
SELECT "Title", "Price"
FROM "Books"
WHERE "Price" > 400000
ORDER BY "Price" DESC
LIMIT 20;

-- 2. Query using JSONB
EXPLAIN ANALYZE
SELECT "Title", "Properties"->>'Pages' AS "Pages"
FROM "Books"
WHERE "Properties" @> '{"Language": "Persian"}';

-- 3. Query using Array
EXPLAIN ANALYZE
SELECT "Title", "Genres"
FROM "Books"
WHERE "Genres" @> ARRAY['Bestseller', 'Fiction'];

-- 4. Query with JOIN
EXPLAIN ANALYZE
SELECT "B"."Title", "A"."Name", "S"."Revenue"
FROM "Books" AS "B"
JOIN "Authors" AS "A" ON "B"."AuthorId" = "A"."Id"
LEFT JOIN "Sales" AS "S" ON "B"."Id" = "S"."BookId"
WHERE "B"."Year" > 2000;

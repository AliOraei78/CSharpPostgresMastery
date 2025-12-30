EXPLAIN ANALYZE
SELECT "Title"
FROM "Books"
WHERE "AuthorId" IN (
    SELECT "Id" FROM "Authors" WHERE "Country" = 'England'
);

EXPLAIN ANALYZE
SELECT "Title"
FROM "Books" AS "B"
WHERE EXISTS (
    SELECT 1
    FROM "Authors" AS "A"
    WHERE "A"."Id" = "B"."AuthorId" 
      AND "A"."Country" = 'England'
);
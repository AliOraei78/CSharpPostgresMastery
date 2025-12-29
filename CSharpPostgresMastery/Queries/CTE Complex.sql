WITH 
"CheapBooks" AS (
    SELECT "Title", "Price" FROM "Books" WHERE "Price" < 100000
),
"ExpensiveBooks" AS (
    SELECT "Title", "Price" FROM "Books" WHERE "Price" >= 100000
)

SELECT 'Cheap' AS "Category", COUNT(*) AS Count FROM "CheapBooks"
UNION ALL
SELECT 'Expensive', COUNT(*) FROM "ExpensiveBooks";
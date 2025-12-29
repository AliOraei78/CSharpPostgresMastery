WITH "ExpensiveBooks" AS (
    SELECT "Id", "Title", "Author", "Price"
    FROM "Books"
    WHERE "Price" > 100000
)

SELECT * FROM "ExpensiveBooks"
ORDER BY "Price" DESC;
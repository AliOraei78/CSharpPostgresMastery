SELECT 
    "Title",
    "Author",
    "Price",
    UNNEST("Genres") AS "Genre",
    ROW_NUMBER() OVER (PARTITION BY UNNEST("Genres") ORDER BY "Price" DESC) AS "Rank_In_Genre"
FROM "Books"
ORDER BY "Genre", "Rank_In_Genre";
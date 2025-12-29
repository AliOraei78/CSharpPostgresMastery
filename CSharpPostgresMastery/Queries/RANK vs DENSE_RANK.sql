SELECT 
    "Title",
    "Price",
    RANK() OVER (ORDER BY "Price" DESC) AS "Rank_With_Gap",
    DENSE_RANK() OVER (ORDER BY "Price" DESC) AS "Dense_Rank_No_Gap",
    ROW_NUMBER() OVER (ORDER BY "Price" DESC) AS "Row_Number"
FROM "Books";
SELECT 
    "Title",
    "Year",
    "Price",
    LAG("Price") OVER (ORDER BY "Year") AS "Previous_Price",
    LEAD("Price") OVER (ORDER BY "Year") AS "Next_Price"
FROM "Books"
ORDER BY "Year";
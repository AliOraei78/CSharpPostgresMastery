SELECT "Title"
FROM "Books"
WHERE "AuthorId" IN (
    SELECT "Id" 
    FROM "Authors" 
    WHERE "Country" = 'England'
);
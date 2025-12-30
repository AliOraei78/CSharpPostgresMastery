SELECT "Title",
       (SELECT "Name" 
        FROM "Authors" AS "A" 
        WHERE "A"."Id" = "B"."AuthorId") AS "AuthorName"
FROM "Books" AS "B";
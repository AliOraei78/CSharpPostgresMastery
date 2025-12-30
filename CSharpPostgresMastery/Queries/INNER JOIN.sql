SELECT "B"."Title", "A"."Name" AS "AuthorName", "A"."Country"
FROM "Books" AS "B"
INNER JOIN "Authors" AS "A" ON "B"."AuthorId" = "A"."Id"
WHERE "B"."Price" > 100000;
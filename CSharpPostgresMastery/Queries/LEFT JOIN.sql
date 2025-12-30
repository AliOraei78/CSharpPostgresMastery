SELECT "B"."Title", "A"."Name" AS "AuthorName"
FROM "Books" AS "B"
LEFT JOIN "Authors" AS "A" ON "B"."AuthorId" = "A"."Id"
WHERE "A"."Name" IS NULL;
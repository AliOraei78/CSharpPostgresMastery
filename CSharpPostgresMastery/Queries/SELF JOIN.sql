SELECT "B1"."Title" AS "Book1", "B2"."Title" AS "Book2", "A"."Name" AS "Author"
FROM "Books" AS "B1"
INNER JOIN "Books" AS "B2" ON "B1"."AuthorId" = "B2"."AuthorId" AND "B1"."Id" < "B2"."Id"
INNER JOIN "Authors" AS "A" ON "B1"."AuthorId" = "A"."Id";
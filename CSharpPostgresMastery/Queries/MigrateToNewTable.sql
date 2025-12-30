-- 1. Rename the original table to preserve it
ALTER TABLE "Books" RENAME TO "BooksOld";

-- 2. Create a new main table as a partitioned table by Year
CREATE TABLE "Books" (
    "Id" UUID NOT NULL,
    "Title" VARCHAR(200) NOT NULL,
    "Author" VARCHAR(100) NOT NULL,
    "Year" INT NOT NULL,
    "Price" DECIMAL(10,2) NOT NULL,
    "Properties" JSONB,
    "Genres" TEXT[],
    "AuthorId" INT,
    "IsAvailable" BOOLEAN,
    PRIMARY KEY ("Id", "Year")
) PARTITION BY RANGE ("Year");

-- 3. Create partitions for year ranges
CREATE TABLE "Books_1900_1950" PARTITION OF "Books"
FOR VALUES FROM (1900) TO (1951);

CREATE TABLE "Books_1951_2000" PARTITION OF "Books"
FOR VALUES FROM (1951) TO (2001);

CREATE TABLE "Books_2001_2026" PARTITION OF "Books"
FOR VALUES FROM (2001) TO (2026);

-- Default partition for unexpected data
CREATE TABLE "Books_Default" PARTITION OF "Books" DEFAULT;

-- 4. Migrate data from the old table to the new partitioned table
INSERT INTO "Books" SELECT * FROM "BooksOld";

-- 5. Drop the old table
--DROP TABLE "BooksOld";

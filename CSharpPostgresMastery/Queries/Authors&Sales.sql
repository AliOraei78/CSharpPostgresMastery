-- Create the Authors table using PascalCase naming
CREATE TABLE "Authors" (
    "Id" SERIAL PRIMARY KEY,
    "Name" VARCHAR(100) NOT NULL,
    "Country" VARCHAR(50),
    "BirthYear" INT
);


-- Insert data
INSERT INTO "Authors" ("Name", "Country", "BirthYear") VALUES
('George Orwell', 'England', 1903),
('Harper Lee', 'USA', 1926),
('J.R.R. Tolkien', 'England', 1892),
('J.K. Rowling', 'England', 1965),
('Jane Austen', 'England', 1775);

-- Add AuthorId column to the Books table
ALTER TABLE "Books" ADD COLUMN "AuthorId" INT REFERENCES "Authors"("Id");

-- Update AuthorId for existing books
UPDATE "Books" SET "AuthorId" = 1 WHERE "Author" = 'George Orwell';
UPDATE "Books" SET "AuthorId" = 2 WHERE "Author" = 'Harper Lee';
UPDATE "Books" SET "AuthorId" = 3 WHERE "Author" = 'J.R.R. Tolkien';
UPDATE "Books" SET "AuthorId" = 4 WHERE "Author" = 'J.K. Rowling';
UPDATE "Books" SET "AuthorId" = 5 WHERE "Author" = 'Jane Austen';

-- Sales table
CREATE TABLE "Sales" (
    "Id" SERIAL PRIMARY KEY,
    "BookId" UUID REFERENCES "Books"("Id"),
    "SaleDate" DATE,
    "Quantity" INT,
    "Revenue" DECIMAL(10,2)
);

-- Insert sales data
INSERT INTO "Sales" ("BookId", "SaleDate", "Quantity", "Revenue") VALUES
('11111111-1111-1111-1111-111111111111', '2025-01-10', 5, 600000.00),
('11111111-1111-1111-1111-111111111111', '2025-02-05', 3, 360000.00),
('22222222-2222-2222-2222-222222222222', '2025-01-15', 2, 300000.00),
('33333333-3333-3333-3333-333333333333', '2025-02-20', 4, 400000.00),
('6edc2147-7a30-42fb-ad73-8694b7d0c7ae', '2025-03-01', 10, 1800000.00);
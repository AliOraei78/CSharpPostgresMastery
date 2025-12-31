-- Add more books to test window functions
INSERT INTO "Books" ("Title", "Author", "Year", "Price", "Properties", "Genres")
VALUES
('The Lord of the Rings', 'J.R.R. Tolkien', 1954, 300000, '{"Pages": 1178, "Publisher": "Allen & Unwin"}', '{Fantasy,Adventure}'),
('Pride and Prejudice', 'Jane Austen', 1813, 90000, '{"Pages": 279, "Publisher": "T. Egerton"}', '{Romance,Classic}'),
('The Catcher in the Rye', 'J.D. Salinger', 1951, 110000, '{"Pages": 277}', '{Fiction}'),
('Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 1997, 180000, '{"Pages": 223, "Publisher": "Bloomsbury"}', '{Fantasy,Young Adult}'),
('Animal Farm', 'George Orwell', 1945, 80000, '{"Pages": 112}', '{Political Fiction,Dystopian}');

-- Categories table (for recursive queries)
CREATE TABLE "Categories" (
    "Id" SERIAL PRIMARY KEY,
    "Name" VARCHAR(100) NOT NULL,
    "ParentId" INT REFERENCES "Categories"("Id")
);

INSERT INTO "Categories" ("Name", "ParentId") VALUES
('Fiction', NULL),
('Non-Fiction', NULL),
('Classic', 1),
('Fantasy', 1),
('Dystopian', 1),
('Romance', 1),
('Science', 2),
('History', 2),
('High Fantasy', 4);

-- Index on price (optimizes ORDER BY and >, <, = filters)
CREATE INDEX idx_books_price ON "Books" ("Price");

-- Index on publication year
CREATE INDEX idx_books_year ON "Books" ("Year");

-- Composite index on author + year (for combined filters)
CREATE INDEX idx_books_author_year ON "Books" ("Author", "Year");

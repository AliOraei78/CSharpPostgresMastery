-- Insert 100,000 random books for real partitioning tests
INSERT INTO "Books" ("Title", "Author", "Year", "Price", "Properties", "Genres")
SELECT
'Book ' || gs,
'Author ' || (gs % 1000 + 1),
1900 + (gs % 126),  -- Years from 1900 to 2025
(random() * 500000 + 50000)::decimal(10,2),
jsonb_build_object(
'Pages', (random() * 1000 + 100)::int,
'Publisher', 'Publisher ' || (gs % 200 + 1)
),
ARRAY[
	CASE WHEN random() > 0.5 THEN 'Fiction' ELSE 'Non-Fiction' END,
	CASE WHEN random() > 0.6 THEN 'Classic' ELSE 'Modern' END,
	CASE WHEN random() > 0.8 THEN 'Bestseller' ELSE 'Regular' END
]::text[]
FROM generate_series(1, 100000) AS gs;
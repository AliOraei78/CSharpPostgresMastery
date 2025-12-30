-- Insert 5,000 random books for performance testing
INSERT INTO "Books" ("Title", "Author", "Year", "Price", "Properties", "Genres")
SELECT
    'Book ' || generate_series,
    'Author ' || (generate_series % 100 + 1),
    1900 + (generate_series % 125),
    (random() * 500000 + 50000)::decimal(10,2),
    jsonb_build_object(
        'Pages', (random() * 1000 + 100)::int,
        'Publisher', 'Publisher ' || (generate_series % 50 + 1),
        'Language', CASE WHEN random() > 0.8 THEN 'Persian' ELSE 'English' END
    ),
    ARRAY[
        CASE WHEN random() > 0.5 THEN 'Fiction' ELSE 'Non-Fiction' END,
        CASE WHEN random() > 0.7 THEN 'Classic' ELSE 'Modern' END
    ]::text[]
FROM generate_series(4, 5003);

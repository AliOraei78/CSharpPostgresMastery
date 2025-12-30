-- Book inventory table (for concurrency testing)
CREATE TABLE "BookInventory" (
    "BookId" UUID PRIMARY KEY REFERENCES "Books"("Id"),
    "Stock" INT NOT NULL DEFAULT 100,
    "Version" INT NOT NULL DEFAULT 0  -- For optimistic locking
);

-- Populate initial inventory
INSERT INTO "BookInventory" ("BookId", "Stock")
SELECT "Id", 100 FROM "Books"
ON CONFLICT DO NOTHING;

-- Orders table (for transaction testing)
CREATE TABLE "Orders" (
    "Id" SERIAL PRIMARY KEY,
    "BookId" UUID REFERENCES "Books"("Id"),
    "Quantity" INT NOT NULL,
    "OrderDate" TIMESTAMP DEFAULT NOW(),
    "Status" VARCHAR(20) DEFAULT 'Pending'
);

-- Display the hierarchical structure of categories (tree)
WITH RECURSIVE "CategoryTree" AS (
    -- Anchor: root categories
    SELECT 
        "Id", 
        "Name", 
        "ParentId", 
        CAST("Name" AS TEXT) AS "Path", -- Cast to TEXT to avoid type mismatch
        0 AS "Level"
    FROM "Categories"
    WHERE "ParentId" IS NULL

    UNION ALL

    -- Recursive: children
    SELECT 
        c."Id", 
        c."Name", 
        c."ParentId", 
        ct."Path" || ' > ' || c."Name", -- Now both sides are treated as TEXT
        ct."Level" + 1
    FROM "Categories" c
    INNER JOIN "CategoryTree" ct ON c."ParentId" = ct."Id"
)

SELECT 
    LPAD(' ', "Level" * 4) || "Name" AS "Hierarchy",
    "Path",
    "Level"
FROM "CategoryTree"
ORDER BY "Path";
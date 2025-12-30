# C# PostgreSQL Mastery

A deep learning project for PostgreSQL with C#

## Day 1 – PostgreSQL Basics + Installation

- PostgreSQL 16 installed and running on localhost:5432
- pgAdmin 4 connected to the local server
- Database `BookStoreDb` created
- `Books` table created with seed data (3 records)
- C# connection test using Npgsql completed successfully
- Simple SELECT query executed from a console application


## Day 2 - CRUD with EF Core + PostgreSQL

- Npgsql.EntityFrameworkCore.PostgreSQL integration.
- AppDbContext with Book model.
- Seed data in OnModelCreating.
- Async CRUD operations in console app.
- Migration created and applied.
- Connection string in appsettings.json.
- Full CRUD test successful.

## Day 3 - Advanced Data Types: UUID + JSONB + Array

- UUID as primary key with gen_random_uuid()
- JSONB column for semi-structured properties (Pages, Publisher, etc.)
- Text array for genres list
- EF Core value conversions for Dictionary and List
- Seed data with complex types
- Query and display advanced types in console

## Day 4 - T-SQL Advanced: CTE, Window Functions, Recursive Queries

- Common Table Expressions (CTE) for complex queries
- Multiple CTEs in single query
- Window functions:
  - ROW_NUMBER with PARTITION BY
  - RANK vs DENSE_RANK vs ROW_NUMBER
  - LAG/LEAD for previous/next values
- Recursive CTE for hierarchical data (category tree)
- UNNEST for array columns in queries
- Sample data with genres and categories

## Day 5 - Advanced Joins + Subqueries + EXISTS vs IN + Execution Plan

- PascalCase table/column names with double quotes
- INNER, LEFT, SELF JOIN examples
- Subquery in SELECT (correlated)
- IN vs EXISTS performance comparison
- NOT EXISTS for anti-join
- Execution Plan analysis with EXPLAIN ANALYZE
- Join optimization: avoiding subqueries in WHERE

## Day 6 - Strategic Indexing in PostgreSQL

- B-Tree indexes on Price, Year, and composite (Author + Year)
- GIN indexes for JSONB ("Properties") and Array ("Genres")
- Partial index for expensive books
- BRIN index for large, ordered data
- EXPLAIN ANALYZE comparison: before vs after indexing
- Index types: B-Tree (default), GIN (JSON/Array), BRIN (large tables), Partial (conditional)
- Performance improvement: from Seq Scan to Index Scan

## Day 7 - Query Optimization + EXPLAIN ANALYZE + Vacuum/Autovacuum

- Deep analysis of Execution Plan with EXPLAIN ANALYZE
- Identifying slow queries (Seq Scan, Filter)
- Optimization with proper indexes (GIN on JSONB key, GIN on array)
- Before/after comparison: Seq Scan → Bitmap Index Scan
- Manual VACUUM and VACUUM ANALYZE
- Monitoring autovacuum activity
- Tuning autovacuum parameters per table
- Maintaining database performance with large data

## Day 8 - Transactions + Isolation Levels + Locking

- BEGIN/COMMIT/ROLLBACK transactions
- Isolation Levels:
  - Read Committed (default)
  - Repeatable Read
  - Serializable (highest isolation)
- Row-level locking with SELECT FOR UPDATE
- Deadlock detection and resolution
- Optimistic concurrency control with Version column
- Best practices: short transactions, consistent access order
- SAVEPOINT for partial rollback
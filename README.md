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
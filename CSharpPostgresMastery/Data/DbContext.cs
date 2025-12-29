using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Text.Json;
using CSharpPostgresMastery.Models;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace CSharpPostgresMastery.Data;

public class AppDbContext : DbContext
{
    public DbSet<Book> Books { get; set; } = null!;

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Book>(entity =>
        {
            // 1. Configure primary key
            entity.HasKey(b => b.Id);

            entity.Property(b => b.Id)
                  .HasColumnType("uuid")
                  .HasDefaultValueSql("gen_random_uuid()")
                  .ValueGeneratedOnAdd();

            // 2. Configure dictionary (Properties) – code you previously added
            entity.Property(b => b.Properties)
                  .HasColumnType("jsonb")
                  .HasConversion(
                      v => JsonSerializer.Serialize(v, JsonSerializerOptions.Default),
                      v => JsonSerializer.Deserialize<Dictionary<string, object>>(v, JsonSerializerOptions.Default) ?? new())
                  .Metadata.SetValueComparer(new ValueComparer<Dictionary<string, object>>(
                      (c1, c2) =>
                          JsonSerializer.Serialize(c1, JsonSerializerOptions.Default) ==
                          JsonSerializer.Serialize(c2, JsonSerializerOptions.Default),
                      c => c.Aggregate(0, (a, v) =>
                          HashCode.Combine(a, v.Key.GetHashCode(),
                              v.Value != null ? v.Value.GetHashCode() : 0)),
                      c =>
                          JsonSerializer.Deserialize<Dictionary<string, object>>(
                              JsonSerializer.Serialize(c, JsonSerializerOptions.Default),
                              JsonSerializerOptions.Default) ?? new()));

            // 3. Configure list (Genres) – *** new and critical section ***
            entity.Property(b => b.Genres)
                  .HasColumnType("text[]")
                  .Metadata.SetValueComparer(new ValueComparer<List<string>>(
                      (c1, c2) => c1.SequenceEqual(c2), // Compare list contents
                      c => c.Aggregate(0, (a, v) => HashCode.Combine(a, v.GetHashCode())), // Generate stable hash code
                      c => c.ToList())); // Create a snapshot copy

            // 4. Seed data
            entity.HasData(
                new Book
                {
                    Id = new Guid("11111111-1111-1111-1111-111111111111"),
                    Title = "1984",
                    Author = "George Orwell",
                    Year = 1949,
                    Price = 120000m,
                    Properties = new Dictionary<string, object>
                    {
                    { "Pages", 328 },
                    { "Publisher", "Secker & Warburg" },
                    { "Language", "English" }
                    },
                    Genres = new List<string> { "Dystopian", "Political Fiction" }
                },
                new Book
                {
                    Id = new Guid("22222222-2222-2222-2222-222222222222"),
                    Title = "To Kill a Mockingbird",
                    Author = "Harper Lee",
                    Year = 1960,
                    Price = 150000m,
                    Properties = new Dictionary<string, object>
                    {
                    { "Pages", 281 },
                    { "Publisher", "J. B. Lippincott & Co." }
                    },
                    Genres = new List<string> { "Fiction", "Classic" }
                },
                new Book
                {
                    Id = new Guid("33333333-3333-3333-3333-333333333333"),
                    Title = "The Great Gatsby",
                    Author = "F. Scott Fitzgerald",
                    Year = 1925,
                    Price = 100000m,
                    Properties = new Dictionary<string, object>
                    {
                    { "Pages", 180 }
                    },
                    Genres = new List<string> { "Tragedy", "Classic" }
                }
            );
        });
    }
}

using Microsoft.EntityFrameworkCore;
using CSharpPostgresMastery.Models;

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
        // Seed data
        modelBuilder.Entity<Book>().HasData(
            new Book { Id = 1, Title = "1984", Author = "George Orwell", Year = 1949, Price = 120000m },
            new Book { Id = 2, Title = "To Kill a Mockingbird", Author = "Harper Lee", Year = 1960, Price = 150000m },
            new Book { Id = 3, Title = "The Great Gatsby", Author = "F. Scott Fitzgerald", Year = 1925, Price = 100000m }
        );
    }
}
using CSharpPostgresMastery.Data;
using CSharpPostgresMastery.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

var builder = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
    .Build();

var connectionString = builder.GetConnectionString("DefaultConnection");

// Register DbContext
var optionsBuilder = new DbContextOptionsBuilder<AppDbContext>();
optionsBuilder.UseNpgsql(connectionString);

await using var context = new AppDbContext(optionsBuilder.Options);

// Ensure database is created (automatic migrations)
await context.Database.MigrateAsync();

Console.WriteLine("Database and tables have been created (if they did not exist)");

/*
// Simple CRUD test

// Read (Get All)
Console.WriteLine("\n--- List of Books ---");
books = await context.Books.ToListAsync();
foreach (var book in books)
{
    Console.WriteLine($"{book.Id} | {book.Title} | {book.Author} | {book.Year} | {book.Price:C}");
}

// Create
Console.WriteLine("\n--- Adding a New Book ---");
var newBook = new Book
{
    Title = "Clean Code",
    Author = "Robert C. Martin",
    Year = 2008,
    Price = 250000m
};
context.Books.Add(newBook);
await context.SaveChangesAsync();
Console.WriteLine($"New book added: {newBook.Title} (Id: {newBook.Id})");

// Read again
books = await context.Books.ToListAsync();
Console.WriteLine($"\nTotal number of books: {books.Count}");

// Update
Console.WriteLine("\n--- Updating a Book ---");
var bookToUpdate = await context.Books.FindAsync(1);
if (bookToUpdate != null)
{
    bookToUpdate.Price = 190000m;
    await context.SaveChangesAsync();
    Console.WriteLine("The price of the book '1984' has been updated");
}

// Delete
Console.WriteLine("\n--- Deleting a Book ---");
var bookToDelete = await context.Books.FindAsync(4); // Newly added Id
if (bookToDelete != null)
{
    context.Books.Remove(bookToDelete);
    await context.SaveChangesAsync();
    Console.WriteLine("The book 'Clean Code' has been deleted");
}

// Read (Get All)
Console.WriteLine("\n--- List of Books ---");
books = await context.Books.ToListAsync();
foreach (var book in books)
{
    Console.WriteLine($"{book.Id} | {book.Title} | {book.Author} | {book.Year} | {book.Price:C}");
}

Console.WriteLine("CRUD with EF Core and PostgreSQL is working!");
*/

Console.WriteLine("\n--- List of books with JSONB and Array ---");
var books = await context.Books.ToListAsync();

foreach (var book in books)
{
    Console.WriteLine($"Id: {book.Id}");
    Console.WriteLine($"Title: {book.Title} ({book.Year}) by {book.Author}");
    Console.WriteLine($"Price: {book.Price:C}");
    Console.WriteLine("Genres: " + string.Join(", ", book.Genres));
    Console.WriteLine("Properties:");
    foreach (var prop in book.Properties)
    {
        Console.WriteLine($"  {prop.Key}: {prop.Value}");
    }
    Console.WriteLine("---");
}

Console.ReadKey();

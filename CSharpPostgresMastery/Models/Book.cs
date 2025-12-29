using System.ComponentModel.DataAnnotations;

namespace CSharpPostgresMastery.Models;

public class Book
{
    [Key]
    public Guid Id { get; set; } // UUID instead of int

    public string Title { get; set; } = string.Empty;

    public string Author { get; set; } = string.Empty;

    public int Year { get; set; }

    public decimal Price { get; set; }

    // JSONB: Additional book properties (e.g., page count, publisher, language)
    public Dictionary<string, object> Properties { get; set; } = new();

    // Array: List of book genres
    public List<string> Genres { get; set; } = new();
}

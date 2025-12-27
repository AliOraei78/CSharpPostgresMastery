using Npgsql;

string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=password123;Database=BookStoreDb";

await using var dataSource = NpgsqlDataSource.Create(connectionString);

Console.WriteLine("Successfully connected to PostgreSQL!");

// Test query
await using var cmd = dataSource.CreateCommand("SELECT Id, Title, Author, Year, Price FROM Books");
await using var reader = await cmd.ExecuteReaderAsync();

Console.WriteLine("\n--- Book List ---");
while (await reader.ReadAsync())
{
    Console.WriteLine(
        $"Id: {reader.GetInt32(0)} | Title: {reader.GetString(1)} | Author: {reader.GetString(2)} | Year: {reader.GetInt32(3)} | Price: {reader.GetDecimal(4)}"
    );
}

Console.WriteLine("Database and connection are working!");
Console.ReadKey();

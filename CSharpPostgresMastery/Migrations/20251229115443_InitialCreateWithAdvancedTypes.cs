using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace CSharpPostgresMastery.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreateWithAdvancedTypes : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Books",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false, defaultValueSql: "gen_random_uuid()"),
                    Title = table.Column<string>(type: "text", nullable: false),
                    Author = table.Column<string>(type: "text", nullable: false),
                    Year = table.Column<int>(type: "integer", nullable: false),
                    Price = table.Column<decimal>(type: "numeric", nullable: false),
                    Properties = table.Column<string>(type: "jsonb", nullable: false),
                    Genres = table.Column<List<string>>(type: "text[]", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Books", x => x.Id);
                });

            migrationBuilder.InsertData(
                table: "Books",
                columns: new[] { "Id", "Author", "Genres", "Price", "Properties", "Title", "Year" },
                values: new object[,]
                {
                    { new Guid("11111111-1111-1111-1111-111111111111"), "George Orwell", new List<string> { "Dystopian", "Political Fiction" }, 120000m, "{\"Pages\":328,\"Publisher\":\"Secker \\u0026 Warburg\",\"Language\":\"English\"}", "1984", 1949 },
                    { new Guid("22222222-2222-2222-2222-222222222222"), "Harper Lee", new List<string> { "Fiction", "Classic" }, 150000m, "{\"Pages\":281,\"Publisher\":\"J. B. Lippincott \\u0026 Co.\"}", "To Kill a Mockingbird", 1960 },
                    { new Guid("33333333-3333-3333-3333-333333333333"), "F. Scott Fitzgerald", new List<string> { "Tragedy", "Classic" }, 100000m, "{\"Pages\":180}", "The Great Gatsby", 1925 }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Books");
        }
    }
}

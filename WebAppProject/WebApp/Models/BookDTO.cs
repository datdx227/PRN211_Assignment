using Microsoft.AspNetCore.Mvc;

namespace WebApp.Models
{
    public class BookDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public string Author { get; set; }
        public string Image { get; set; }
        public string CategoryName { get; set; }

    }
}

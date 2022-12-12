using DataLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Repository
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly BookManagementContext _context;
        public CategoryRepository(BookManagementContext context)
        {
            _context = context;
        }
        public void addCategory(Category category)
        {
            _context.Add(category);
            //_context.SaveChanges();
        }

        public List<Category> GetCategories()
        {
            return _context.Categories.ToList();
        }
    }
}

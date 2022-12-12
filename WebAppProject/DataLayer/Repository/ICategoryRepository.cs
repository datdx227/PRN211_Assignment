using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using DataLayer.Models;

namespace DataLayer.Repository
{
    public interface ICategoryRepository
    {
        List<Category> GetCategories();
        void addCategory(Category category);    
    }
}

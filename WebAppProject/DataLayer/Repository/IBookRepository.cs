using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using DataLayer.Models;

namespace DataLayer.Repository
{
    public interface IBookRepository
    {
        Book getBook(Expression<Func<Book, bool>> expression);
        List<Book> getBooks(Expression<Func<Book,bool>> expression);
        void updateBook(Book book); 
        void addBook(Book book);
    }
}

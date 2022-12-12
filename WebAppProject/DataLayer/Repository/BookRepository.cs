using DataLayer.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Repository
{
    public class BookRepository : IBookRepository
    {
        private readonly BookManagementContext _context;
        public BookRepository(BookManagementContext context)
        {
            _context = context;
        }
        public void addBook(Book book)
        {
            _context.Books.Add(book);
            //_context.SaveChanges();
        }

        public Book getBook(Expression<Func<Book, bool>> expression)
        {
            return _context.Books
                     .Include(x => x.Category)
                     .FirstOrDefault(expression);
        }

        public List<Book> getBooks(Expression<Func<Book, bool>> expression)
        {
            return _context.Books
                    .Where(expression)
                    .Include(x => x.Category)
                    .ToList();
        }

        public void updateBook(Book book)
        {
            _context.Books.Update(book);
            //_context.SaveChanges();
        }
    }
}

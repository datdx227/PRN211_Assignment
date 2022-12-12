using DataLayer.Models;
using DataLayer.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        private IAccountRepository _accountRepository;
        private IBookRepository _bookRepository;   
        private ICategoryRepository _categoryRepository;
        private IOrderRepository _orderRepository;
        private IDetailRepository _detailRepository;
        private BookManagementContext _context;
        public UnitOfWork(BookManagementContext context)
        {
            _context = context;
            _orderRepository = new OrderRepository(context);
            _bookRepository = new BookRepository(context);
            _detailRepository = new DetailRepository(context);
            _accountRepository = new AccountRepository(context);    
            _categoryRepository = new CategoryRepository(context);
        }
        public IAccountRepository AccountRepository => _accountRepository;

        public IBookRepository BookRepository => _bookRepository;

        public ICategoryRepository CategoryRepository => _categoryRepository;

        public IDetailRepository DetailRepository => _detailRepository;

        public IOrderRepository OrderRepository => _orderRepository;

        public void Dispose()
        {
            _context.Dispose();
        }

        public void Save()
        {
            _context.SaveChanges();
        }
    }
}

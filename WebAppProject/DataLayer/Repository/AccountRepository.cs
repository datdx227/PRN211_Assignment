using DataLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Repository
{
    public class AccountRepository : IAccountRepository
    {
        private readonly BookManagementContext _context;
        public AccountRepository(BookManagementContext context)
        {
            _context = context;
        }
        public Account checkLogin(string username, string password)
        {
            return _context.Accounts.FirstOrDefault(x => x.Username == username && x.Password == password && x.IsDeleted == false);
        }
        public bool checkUserName(String username)
        {
            var a = _context.Accounts.FirstOrDefault(x => x.Username == username);
            return a == null;
        }
        public void update(Account account)
        {
            _context.Accounts.Update(account);
            //_context.SaveChanges();
        }
        public void add(Account account)
        {
            _context.Accounts.Add(account);
        }
    }
}

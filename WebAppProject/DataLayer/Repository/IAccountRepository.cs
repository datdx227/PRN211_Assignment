using DataLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Repository
{
    public interface IAccountRepository
    {
        Account checkLogin(String username, String password);
        bool checkUserName(String username);
        void update(Account account);
        void add(Account account);
    }
}

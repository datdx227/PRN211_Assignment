using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer.Repository;
namespace DataLayer.UnitOfWork
{
    public interface IUnitOfWork:IDisposable
    {
        
        IAccountRepository AccountRepository { get; }
        IBookRepository BookRepository { get; }
        ICategoryRepository CategoryRepository { get; }
        IDetailRepository DetailRepository { get; } 
        IOrderRepository OrderRepository { get; }
        void Save();
    }
}

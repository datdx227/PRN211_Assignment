using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using DataLayer.Models;

namespace DataLayer.Repository
{
    public interface IOrderRepository
    {
        List<Order> GetAll(int userId);
        void Add(Order order);
        void Update(Order order);
        int getMax();

    }
}

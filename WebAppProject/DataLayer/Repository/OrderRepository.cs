using DataLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Repository
{
    public class OrderRepository : IOrderRepository
    {
        private readonly BookManagementContext _context;
        public OrderRepository(BookManagementContext context)
        {
            _context = context;
        }
        public void Add(Order order)
        {
            _context.Orders.Add(order);
            //_context.SaveChanges(); 
        }

        public List<Order> GetAll(int userId)
        {
            return _context.Orders.Where(o => o.UserId == userId).ToList();
        }

        public void Update(Order order)
        {
            _context.Update(order);
            //_context.SaveChanges(true);
        }
        public int getMax()
        {
            return _context.Orders.Max(x=> x.Id);
        }
    }
}

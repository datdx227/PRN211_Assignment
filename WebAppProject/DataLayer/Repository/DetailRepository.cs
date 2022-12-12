using DataLayer.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Repository
{
    public class DetailRepository:IDetailRepository
    {
        private readonly BookManagementContext _context;
        public DetailRepository(BookManagementContext context)
        {
            _context = context;
        }

        public void add(OrderDetail detail)
        {
            _context.Add(detail);
            //_context.SaveChanges();
        }

        public List<OrderDetail> GetAllByOrderId(int orderId)
        {
            return _context.OrderDetails.Where(x => x.OrderId == orderId)
                .Include(x=> x.Book)
                .ToList();
        }

        public OrderDetail GetByDetailId(int Id)
        {
            return _context.OrderDetails
                .Include(x => x.Book)
                .FirstOrDefault(x => x.Id == Id);
        }
    }
}

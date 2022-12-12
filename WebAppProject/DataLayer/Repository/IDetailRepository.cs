using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using DataLayer.Models;

namespace DataLayer.Repository
{
    public interface IDetailRepository
    {
        List<OrderDetail> GetAllByOrderId(int orderId);
        OrderDetail GetByDetailId(int Id);
        void add(OrderDetail detail);   
    }
}

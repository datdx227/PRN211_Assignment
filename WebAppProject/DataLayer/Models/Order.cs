using System;
using System.Collections.Generic;

namespace DataLayer.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }
        public int UserId { get; set; }
        public decimal Total { get; set; }
        public string? Address { get; set; }
        public string? Phone { get; set; }
        public DateTime BuyDate { get; set; }
        public string? Email { get; set; }
        public string? CustomerName { get; set; }
        public string? Status { get; set; }
        public int? CustomerId { get; set; }

        public virtual Account? Customer { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}

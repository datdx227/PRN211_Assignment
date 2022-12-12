using DataLayer.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using DataLayer.UnitOfWork;
using AutoMapper;
using WebApp.Models;
using Microsoft.AspNetCore.Authorization;

namespace WebApp.Controllers
{
    
    public class CartController : Controller
    {
        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;
       
        public CartController(IUnitOfWork unit,IMapper mapper)
        {
            unitOfWork = unit;
            this.mapper = mapper;
        }

        public IActionResult Add(int id)
        {
            Dictionary<int, BookDTO> cart;
            String? a = HttpContext.Session.GetString("cart");
            if (a != null) cart = JsonConvert.DeserializeObject<Dictionary<int, BookDTO>>(a);
            else cart = new Dictionary<int, BookDTO>();
            if (cart.ContainsKey(id))
            {
                cart[id].Quantity += 1;
            }
            else
            {
                var book = unitOfWork.BookRepository.getBook(x => x.Id == id && x.Status);
                book.Quantity = 1;
                cart.Add(id, mapper.Map<BookDTO>(book));
            }
            HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(cart));
            return RedirectToAction("Index", "Home", new { name = "", mess = "Add to Cart Success!" });
        }

        public IActionResult Update(int id,int quantity)
        {
            Dictionary<int, BookDTO> cart = new Dictionary<int, BookDTO>();
            String? a = HttpContext.Session.GetString("cart");
            if (a != null) cart = JsonConvert.DeserializeObject<Dictionary<int, BookDTO>>(a);
            cart[id].Quantity = quantity;
            if (quantity == 0) cart.Remove(id); 
            HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(cart));
            return RedirectToAction("ViewCart");
        }
        public IActionResult ViewCart()
        {
            Dictionary<int, BookDTO> cart = new Dictionary<int, BookDTO>();
            String? a = HttpContext.Session.GetString("cart");
            if (a != null) cart = JsonConvert.DeserializeObject<Dictionary<int, BookDTO>>(a);
            return View(cart.Values);
        }
        [Authorize(Roles = "User")]
        public IActionResult Payment()
        {
            decimal Total = 0;
            String? a = HttpContext.Session.GetString("cart");
            var cart = JsonConvert.DeserializeObject<Dictionary<int, BookDTO>>(a);
            string mess = "Not enough quantity: ";
            bool check = false;
            foreach(var item in cart)
            {
                var book = unitOfWork.BookRepository.getBook(x=> x.Id == item.Value.Id);
                Total += book.Price * item.Value.Quantity;
                if (item.Value.Quantity > book.Quantity)
                {
                    mess += book.Name + ", ";
                    check = true;
                }
            }
            if (check) 
            {
                ViewBag.mess = mess;
                return View("ViewCart",cart.Values);
            }
            else
            {
                Account user = new Account() ;
                if (HttpContext.Session.GetString("USER") != null)
                    user = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("USER"));
                Order order = new Order()
                {
                    CustomerId = user.Id,
                    CustomerName = user.Username,
                    BuyDate = DateTime.Now,
                    Address = user.Address,
                    Email = "khongco@mail",
                    Phone = user.Phone,
                    Status = "Pending",
                    Total = Total,
                    UserId = user.Id,
                };

                unitOfWork.OrderRepository.Add(order);
                unitOfWork.Save();

                int id = unitOfWork.OrderRepository.getMax();
                foreach(var item in cart)
                {
                    var book = unitOfWork.BookRepository.getBook(x=> x.Id ==item.Value.Id);
                    book.Quantity -= item.Value.Quantity;
                    
                    OrderDetail detail = new OrderDetail()
                    {
                        BookId = book.Id,
                        OrderId = id,
                        Price = item.Value.Price,
                        Quantity = item.Value.Quantity,

                    };
                    unitOfWork.DetailRepository.add(detail);

                }
                unitOfWork.Save();
                HttpContext.Session.Remove("cart");
                ViewBag.mess = "Order Confirm Success!";
                cart.Clear();
                return View("ViewCart", cart.Values);
            }
        }
    }
}

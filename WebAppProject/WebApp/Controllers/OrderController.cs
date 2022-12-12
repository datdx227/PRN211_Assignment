using DataLayer.Models;
using DataLayer.UnitOfWork;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Security.Claims;

namespace WebApp.Controllers
{
    public class OrderController : Controller
    {
        private IUnitOfWork _unitOfWork;
        public OrderController(IUnitOfWork unitOf)
        {
            _unitOfWork = unitOf;
        }
        [Authorize(Roles = "User")]
        public IActionResult Index()
        {
            var a = HttpContext.User.Claims.First(x=> x.Type=="Id").Value;
            var orders = _unitOfWork.OrderRepository.GetAll(int.Parse(a));
            return View(orders);
        }
        [Authorize(Roles ="User")]
        [HttpPost]
        public IActionResult Details(int orderId)
        {
            var details = _unitOfWork.DetailRepository.GetAllByOrderId(orderId);
            return View(details);
        }
    }
}

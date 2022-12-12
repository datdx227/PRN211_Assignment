using AutoMapper;
using DataLayer.Models;
using DataLayer.UnitOfWork;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Security.Claims;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;
        public HomeController(IUnitOfWork unit,IMapper mapper)
        {
            unitOfWork = unit;
            this.mapper = mapper;
        }
        public IActionResult Index(String name,String mess)
        {
            if (name == null) name = "";
            var books = unitOfWork.BookRepository.getBooks(x => x.Status && x.Name.Contains(name));
            if (mess != null) ViewBag.mess = mess;
            return View(books);
        }
        public IActionResult LoginPage(String mess)
        {
            if (mess != null) ViewBag.Message = mess;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(LoginAccount loginAccount)
        {
            if (ModelState.IsValid)
            {
                var account = unitOfWork.AccountRepository.checkLogin(loginAccount.UserName, loginAccount.Password);    
                if (account == null)
                {
                    var mess = "User not exist";
                    return RedirectToAction("LoginPage",new { mess = mess});
                    
                }
                else
                {
                    String role;
                    if (account.RoleId == 1) role = "Admin";
                    else role = "User";
                    HttpContext.Session.SetString("USER", JsonConvert.SerializeObject(account));
                    var claims = new List<Claim>();
                    claims.Add(new Claim("username", loginAccount.UserName));
                    claims.Add(new Claim("Id", account.Id.ToString()));
                    claims.Add(new Claim(ClaimTypes.NameIdentifier, account.FullName));
                    claims.Add(new Claim(ClaimTypes.Role, role));
                    var claimIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    var claimPrincipal = new ClaimsPrincipal(claimIdentity);
                    await HttpContext.SignInAsync(claimPrincipal);
                    return RedirectToAction("Index");
                }
            }
            return RedirectToAction("LoginPage");
        }
        [Authorize]
        public IActionResult Private()
        {
            return View();
        }
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            HttpContext.Session.Clear();
            return RedirectToAction("Index");
        }
        public IActionResult CreateAccount(AccountDTO account)
        {
            if (account.Username == null || account.Username == "") return View();
            if (account !=null) ViewBag.acc = account;
            if (account.Confirm != account.Password)
            {
                ViewBag.Mess = "Password and confirm Password not match";
                return View();
            }

            var check = unitOfWork.AccountRepository.checkUserName(account.Username);
            if (!check)
            {
                ViewBag.Mess = "Duplicated User Name";
                return View();
            }
           
            Account acc = mapper.Map<Account>(account);
            acc.RoleId = 2;
            acc.Point = 0;
            acc.IsDeleted = false;
            acc.Rank = "Normal";
            unitOfWork.AccountRepository.add(acc);
            unitOfWork.Save();

            return RedirectToAction("LoginPage",new { mess="Create Success, Please Login!"});
        }
    }
}

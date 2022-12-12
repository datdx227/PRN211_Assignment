using Microsoft.EntityFrameworkCore;
using DataLayer.Models;
using Microsoft.Extensions.Configuration;
using DataLayer.UnitOfWork;
using Microsoft.AspNetCore.Authentication.Cookies;
using AutoMapper;
using WebApp.Mapper;

var builder = WebApplication.CreateBuilder(args);

IConfiguration configuration = builder.Configuration;
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<BookManagementContext>(x => 
            x.UseSqlServer(configuration.GetConnectionString("Conn")));
var config = new MapperConfiguration(cfg =>
{
    cfg.AddProfile(new AutoMapperProfile());
});
IMapper mapper = config.CreateMapper();
builder.Services.AddSingleton(mapper);
builder.Services.AddScoped<IUnitOfWork>(x => new UnitOfWork(x.GetService<BookManagementContext>()));

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie(
                options =>
                {
                    options.LoginPath = "/Home/LoginPage";

                }
                );
builder.Services.AddSession();

var app = builder.Build();

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseSession();
app.UseRouting();


app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
app.Run();

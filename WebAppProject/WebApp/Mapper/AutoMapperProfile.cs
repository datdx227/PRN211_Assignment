using AutoMapper;
using DataLayer.Models;
using WebApp.Models;
namespace WebApp.Mapper
{
    public class AutoMapperProfile:Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<Account, AccountDTO>();
            CreateMap<AccountDTO,Account>();
            CreateMap<Book, BookDTO>()
                .ForMember(x => x.CategoryName, act => act.MapFrom(x => x.Category.Name));
        }
    }
}

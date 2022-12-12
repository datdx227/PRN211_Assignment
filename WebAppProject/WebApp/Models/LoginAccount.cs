using System.ComponentModel.DataAnnotations;

namespace WebApp.Models
{
    public class LoginAccount
    {
        [Required (ErrorMessage ="Wrong format")]
        [DataType(DataType.Text)]
        [Display(Name ="UserName")]
        [MaxLength(20)]
        [MinLength(4)]

        public string UserName { get; set; }
        [Required(ErrorMessage = "Wrong format")]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        [MaxLength(20)]
        [MinLength(4)]
        public string Password { get; set; }
    }
}

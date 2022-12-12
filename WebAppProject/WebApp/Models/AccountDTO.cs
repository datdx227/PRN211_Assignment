using System.ComponentModel.DataAnnotations;

namespace WebApp.Models
{
    public class AccountDTO
    {
        public int Id { get; set; }
        [Required]
        [StringLength(100, ErrorMessage ="Wrong Name format")]
        public string FullName { get; set; }
        [Required]
        [DataType(DataType.PhoneNumber)]
        public string Phone { get; set; }
        public int Point { get; set; }
        public string Rank { get; set; }
        [Required]
        [StringLength(100, ErrorMessage = "Wrong Name format")]
        public string Address { get; set; }
        [Required]
        [StringLength(100, ErrorMessage = "Wrong Address format")]
        public string Username { get; set; }
        [Required]
        [StringLength(100, ErrorMessage = "Wrong Password format")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Required]
        [StringLength(100, ErrorMessage = "Wrong Confirm Password format")]
        [DataType(DataType.Password)]
        public string Confirm { get; set; }
        public int RoleId { get; set; }
    }
}

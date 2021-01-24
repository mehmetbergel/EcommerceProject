using System.ComponentModel.DataAnnotations;

namespace Ecommerce.BLL.ViewModel
{
    public class LoginViewModel
    {
        public string Username { get; set; }

        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
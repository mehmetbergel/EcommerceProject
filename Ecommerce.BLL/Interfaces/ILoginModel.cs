using Ecommerce.BLL.ViewModel;

namespace Ecommerce.BLL.Interfaces
{
    public interface ILoginModel
    {
        bool TryLogin(LoginViewModel loginViewModel);
        int GetRoleId(string userName);
    }
}

using Ecommerce.BLL.Base;
using Ecommerce.BLL.Interfaces;
using Ecommerce.BLL.ViewModel;

using System;
using System.Linq;

namespace Ecommerce.BLL.Models
{
    public class LoginModel : BaseService, ILoginModel
    {
        public bool TryLogin(LoginViewModel loginViewModel)
        {
            try
            {
                var userList = DBModel.UserInfo.Where(x => x.UserName == loginViewModel.Username && x.Password == loginViewModel.Password).ToList();

                if (userList.Count() > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                bool result = new LogModel().AddErrorLog("LoginModel", "TryLogin", ex.Message, ex.InnerException.ToString());
                return false;
            }
        }

        public int GetRoleId(string userName)
        {
            try
            {
                return DBModel.UserInfo.Where(x => x.UserName == userName).FirstOrDefault().RoleId;
            }
            catch (Exception ex)
            {
                bool result = new LogModel().AddErrorLog("LoginModel", "GetRoleId", ex.Message, ex.InnerException.ToString());
                return -1;
            }
        }
    }
}
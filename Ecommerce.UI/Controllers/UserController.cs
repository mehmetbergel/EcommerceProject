using Ecommerce.BLL.Interfaces;
using Ecommerce.BLL.ViewModel;

using System.Web.Mvc;

namespace Ecommerce.UI.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        private ILoginModel _loginModel;
        public UserController(ILoginModel loginModel)
        {
            _loginModel = loginModel;
        }

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel loginViewModel)
        {
            if (ModelState.IsValid)
            {
                bool isLogin = _loginModel.TryLogin(loginViewModel);
                if (isLogin)
                {
                    Session["RoleId"] = _loginModel.GetRoleId(loginViewModel.Username);
                    return RedirectToAction("Index", "Stock");
                }
                else
                {
                    ViewBag.Message = "Kullanıcı Adı veya Şifre Hatalı!";
                    return View("Index");
                }
            }
            else
            {
                return View("Index");
            }
        }
    }
}
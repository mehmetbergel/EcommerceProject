using Ecommerce.DAL.EntityDataModels;
using Ecommerce.DAL.Helper;

namespace Ecommerce.BLL.Base
{
    public class BaseService
    {
        public static EcommerceDBEntities DBModel { get; set; }

        public BaseService()
        {
            DBModel = DBHelper.CreateDBConnection();
        }
    }
}

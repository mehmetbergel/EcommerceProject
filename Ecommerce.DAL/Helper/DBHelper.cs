using Ecommerce.DAL.EntityDataModels;

namespace Ecommerce.DAL.Helper
{
    public class DBHelper
    {
        private static EcommerceDBEntities DBConnection { get; set; }

        public static EcommerceDBEntities CreateDBConnection()
        {
            DBConnection = DBConnection ?? new EcommerceDBEntities();

            return DBConnection;
        }
    }
}

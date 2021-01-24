using Ecommerce.BLL.Base;
using Ecommerce.DAL.EntityDataModels;

using System;

namespace Ecommerce.BLL.Models
{
    public class LogModel : BaseService
    {
        public LogModel()
        {
            DBModel = new EcommerceDBEntities();
        }
        public bool AddErrorLog(string className, string methodName, string message, string innerException)
        {
            try
            {
                ErrorLogs log = new ErrorLogs();
                log.ClassName = className;
                log.MethodName = methodName;
                log.Message = message;
                log.InnerException = innerException;
                log.LogDate = DateTime.Now;

                DBModel.ErrorLogs.Add(log);
                int result = DBModel.SaveChanges();
                if (result > 0)
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
                return false;
            }
        }
    }
}
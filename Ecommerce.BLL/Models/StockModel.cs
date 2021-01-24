using Ecommerce.BLL.Base;
using Ecommerce.BLL.ViewModel;
using Ecommerce.DAL.EntityDataModels;

using System;
using System.Collections.Generic;
using System.Linq;

namespace Ecommerce.BLL.Models
{
    public class StockModel : BaseService, IStockModel
    {
        public StockModel()
        {
            DBModel = new EcommerceDBEntities();
        }

        public List<StockViewModel> GetStockList()
        {
            try
            {
                var stockList = DBModel.StockInfo.ToList();
                List<StockViewModel> list = new List<StockViewModel>();
                foreach (var item in stockList)
                {
                    StockViewModel viewModel = new StockViewModel();
                    viewModel.Id = item.ID;
                    viewModel.Barcode = item.Barcode;
                    viewModel.Name = item.Name;
                    viewModel.Price = item.Price;
                    viewModel.Quantity = item.Quantity;
                    viewModel.Description = item.Description;
                    viewModel.StockImageList = DBModel.StockImage.Where(x => x.Barcode == item.Barcode).ToList();
                    if (viewModel.StockImageList.Count > 0)
                    {
                        viewModel.BaseImage = viewModel.StockImageList.FirstOrDefault(x => x.Barcode == item.Barcode).Source;
                    }

                    list.Add(viewModel);
                }
                return list;
            }
            catch (Exception ex)
            {
                bool result = new LogModel().AddErrorLog("StockModel", "GetStockList", ex.Message, ex.InnerException != null ? ex.InnerException.ToString() : null);
                return null;
            }
        }

        public Tuple<bool, string> AddStock(StockViewModel viewModel)
        {
            try
            {
                StockInfo stock = new StockInfo();
                stock.Barcode = viewModel.Barcode;
                stock.Name = viewModel.Name;
                stock.Price = viewModel.Price;
                stock.Quantity = viewModel.Quantity;
                stock.Description = viewModel.Description;
                DBModel.StockInfo.Add(stock);
                var result = DBModel.SaveChanges();

                if (result > 0)
                    return Tuple.Create(true, "Kayıt Başarılı!");

                else
                    return Tuple.Create(false, "Kayıt Başarısız!");
            }
            catch (Exception ex)
            {
                bool result = new LogModel().AddErrorLog("StockModel", "AddStock", ex.Message, ex.InnerException != null ? ex.InnerException.ToString() : null);
                return Tuple.Create(false, ex.Message);
            }
        }

        public Tuple<bool, string> UploadImage(string barcode, string source)
        {
            try
            {
                StockImage stockImage = new StockImage();
                stockImage.Barcode = barcode;
                stockImage.Source = source;
                DBModel.StockImage.Add(stockImage);
                var result = DBModel.SaveChanges();

                if (result > 0)
                    return Tuple.Create(true, "Kayıt Başarılı!");

                else
                    return Tuple.Create(false, "Kayıt Başarısız!");
            }
            catch (Exception ex)
            {
                bool result = new LogModel().AddErrorLog("StockModel", "UploadImage", ex.Message, ex.InnerException != null ? ex.InnerException.ToString() : null);
                return Tuple.Create(false, ex.Message);
            }
        }

        public List<StockImage> GetStockImages(int Id)
        {
            try
            {
                string barcode = DBModel.StockInfo.Where(x => x.ID == Id).FirstOrDefault().Barcode;
                return DBModel.StockImage.Where(x => x.Barcode == barcode).ToList();
            }
            catch (Exception ex)
            {
                bool result = new LogModel().AddErrorLog("StockModel", "GetStockImages", ex.Message,
                    ex.InnerException != null ? ex.InnerException.ToString() : null);
                return null;
            }
        }

        public Tuple<bool, string> EditStock(StockViewModel viewModel)
        {
            try
            {
                StockInfo stock = new StockInfo();
                stock = DBModel.StockInfo.Where(x => x.Barcode == viewModel.Barcode).FirstOrDefault();

                stock.Barcode = viewModel.Barcode;
                stock.Name = viewModel.Name;
                stock.Price = viewModel.Price;
                stock.Quantity = viewModel.Quantity;
                stock.Description = viewModel.Description;

                int result = DBModel.SaveChanges();

                if (result > 0)
                    return Tuple.Create(true, "Düzenleme Başarılı!");

                else
                    return Tuple.Create(false, "Düzenleme Başarısız!");

            }
            catch (Exception ex)
            {
                bool result = new LogModel().AddErrorLog("StockModel", "EditStock", ex.Message, ex.InnerException != null ? ex.InnerException.ToString() : null);
                return Tuple.Create(false, ex.Message);
            }
        }

        public Tuple<bool, string> DeleteStock(StockViewModel viewModel)
        {
            try
            {
                StockInfo stock = new StockInfo();
                stock = DBModel.StockInfo.Where(x => x.Barcode == viewModel.Barcode).FirstOrDefault();
                DBModel.StockInfo.Remove(stock);
                int result = DBModel.SaveChanges();

                if (result > 0)
                    return Tuple.Create(true, "Silme Başarılı!");

                else
                    return Tuple.Create(false, "Silme Başarısız!");
            }
            catch (Exception ex)
            {
                bool result = new LogModel().AddErrorLog("StockModel", "DeleteStock", ex.Message, ex.InnerException != null ? ex.InnerException.ToString() : null);
                return Tuple.Create(false, ex.Message);
            }
        }

        public Tuple<bool, string> DeleteImage(StockViewModel viewModel)
        {
            try
            {
                List<StockImage> stock = new List<StockImage>();
                stock = DBModel.StockImage.Where(x => x.Barcode == viewModel.Barcode).ToList();

                if (stock.Count > 0)
                {
                    int result = 0;
                    foreach (var item in stock)
                    {
                        DBModel.StockImage.Remove(item);
                        result = DBModel.SaveChanges();
                    }

                    if (result > 0)
                        return Tuple.Create(true, "Silme Başarılı!");

                    else
                        return Tuple.Create(false, "Silme Başarısız!");
                }
                else
                    return Tuple.Create(true, "Silme Başarılı!");
            }
            catch (Exception ex)
            {
                bool result = new LogModel().AddErrorLog("StockModel", "DeleteStock", ex.Message, ex.InnerException != null ? ex.InnerException.ToString() : null);
                return Tuple.Create(false, ex.Message);
            }
        }

        public StockViewModel GetStock(string barcode)
        {
            try
            {
                var stockInfo = DBModel.StockInfo.FirstOrDefault(x => x.Barcode == barcode);
                StockViewModel viewModel = new StockViewModel();
                viewModel.Barcode = stockInfo.Barcode;
                viewModel.Name = stockInfo.Name;
                viewModel.Price = stockInfo.Price;
                viewModel.Quantity = stockInfo.Quantity;
                viewModel.Description = stockInfo.Description;

                return viewModel;
            }
            catch (Exception ex)
            {
                bool result = new LogModel().AddErrorLog("StockModel", "GetStock", ex.Message, ex.InnerException != null ? ex.InnerException.ToString() : null);
                return null;
            }
        }
    }
}
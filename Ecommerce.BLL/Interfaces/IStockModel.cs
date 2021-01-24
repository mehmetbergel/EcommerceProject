using Ecommerce.BLL.ViewModel;
using Ecommerce.DAL.EntityDataModels;

using System;
using System.Collections.Generic;

namespace Ecommerce.BLL.Models
{
    public interface IStockModel
    {
        List<StockViewModel> GetStockList();
        Tuple<bool, string> AddStock(StockViewModel viewModel);
        Tuple<bool, string> EditStock(StockViewModel viewModel);
        Tuple<bool, string> DeleteStock(StockViewModel viewModel);
        Tuple<bool, string> DeleteImage(StockViewModel viewModel);
        StockViewModel GetStock(string barcode);
        Tuple<bool, string> UploadImage(string barcode, string source);
        List<StockImage> GetStockImages(int Id);
    }
}

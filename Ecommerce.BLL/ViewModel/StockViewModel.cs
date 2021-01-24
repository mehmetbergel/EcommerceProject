using Ecommerce.DAL.EntityDataModels;

using System.Collections.Generic;

namespace Ecommerce.BLL.ViewModel
{
    public class StockViewModel
    {
        public int Id { get; set; }
        public string Barcode { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public double Quantity { get; set; }
        public string BaseImage { get; set; }
        public List<StockImage> StockImageList { get; set; }
    }
}

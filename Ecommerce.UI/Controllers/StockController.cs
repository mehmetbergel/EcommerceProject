using Ecommerce.BLL.Models;
using Ecommerce.BLL.ViewModel;

using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Mvc;

namespace Ecommerce.UI.Controllers
{
    public class StockController : Controller
    {
        // GET: Stock
        private IStockModel _stockModel;
        public StockController(IStockModel stockModel)
        {
            _stockModel = stockModel;
        }

        public ActionResult Index()
        {
            if (Session["RoleId"] != null)
            {
                ViewBag.RoleId = Session["RoleId"].ToString();
                return View(_stockModel.GetStockList());
            }
            else
            {
                return RedirectToAction("Index", "User");
            }
        }

        public ActionResult Add()
        {
            if (Session["RoleId"] != null)
            {
                ViewBag.RoleId = Session["RoleId"].ToString();
                return View();
            }
            else
            {
                return RedirectToAction("Index", "User");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(StockViewModel stockInfo, IEnumerable<HttpPostedFileBase> selectedFiles)
        {
            if (ModelState.IsValid)
            {
                var result = _stockModel.AddStock(stockInfo);

                if (result.Item1)
                {
                    foreach (var item in selectedFiles)
                    {
                        if (item != null)
                        {
                            string destination = "/Content/images/" + item.FileName;
                            var path = Path.Combine(Server.MapPath("~/Content/images"), item.FileName);
                            item.SaveAs(path);
                            var imageResult = _stockModel.UploadImage(stockInfo.Barcode, destination);
                        }
                    }

                    TempData["Success"] = result.Item2;
                    return RedirectToAction("Index", "Stock");
                }
                else
                {
                    ViewBag.Message = result.Item2;
                    return View();
                }
            }
            else
            {
                ViewBag.Message = "Added Failed!";
                return View();
            }
        }

        public ActionResult Edit(string barcode)
        {
            if (Session["RoleId"] != null)
            {
                ViewBag.RoleId = Session["RoleId"].ToString();
                if (!string.IsNullOrEmpty(barcode))
                {
                    return View(_stockModel.GetStock(barcode));
                }
                else
                {
                    return View();
                }
            }
            else
            {
                return RedirectToAction("Index", "User");
            }
        }

        [HttpPost]
        public ActionResult Edit(StockViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                var result = _stockModel.EditStock(viewModel);
                if (result.Item1)
                {
                    TempData["Success"] = result.Item2;
                    return RedirectToAction("Index", "Stock");
                }
                else
                {
                    TempData["Fail"] = result.Item2;
                    return RedirectToAction("Index", "Stock");
                }
            }
            else
            {
                return View();
            }
        }

        public ActionResult Delete(string barcode)
        {
            if (Session["RoleId"] != null)
            {
                ViewBag.RoleId = Session["RoleId"].ToString();
                if (!string.IsNullOrEmpty(barcode))
                {
                    return View(_stockModel.GetStock(barcode));
                }
                else
                {
                    return View();
                }
            }
            else
            {
                return RedirectToAction("Index", "User");
            }
        }
        [HttpPost]
        public ActionResult Delete(StockViewModel viewModel)
        {
            if (!string.IsNullOrEmpty(viewModel.Barcode))
            {
                var result = _stockModel.DeleteStock(viewModel);
                if (result.Item1)
                {
                    result = _stockModel.DeleteImage(viewModel);

                    if (result.Item1)
                    {
                        TempData["Success"] = result.Item2;

                        return RedirectToAction("Index", "Stock");
                    }
                    else
                    {
                        TempData["Fail"] = result.Item2;
                        return RedirectToAction("Index", "Stock");
                    }
                }
                else
                {
                    TempData["Fail"] = result.Item2;
                    return RedirectToAction("Index", "Stock");
                }
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult ImageList(int Id)
        {
            return PartialView(_stockModel.GetStockImages(Id));
        }
    }
}
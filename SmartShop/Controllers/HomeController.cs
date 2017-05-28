using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Corp.Controllers
{
    public class HomeController : Controller
    {
        private S295076_MinhThuanTranEntities db = new S295076_MinhThuanTranEntities();
        public ActionResult Index()
        {
            

            return View(db.Products.ToList()); //view all
          
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "E-Corp";

            return View();
        }
    }
}
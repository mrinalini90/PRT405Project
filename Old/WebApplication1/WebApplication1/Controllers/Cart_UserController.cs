using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication1;
using Microsoft.AspNet.Identity;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1.Controllers
{
    public class Cart_UserController : Controller
    {
        private PRT405_2017SEM1Entities db = new PRT405_2017SEM1Entities();
        AccountController a = new AccountController();

        // GET: Cart_User
        public ActionResult Index()
        {
            string UserName = User.Identity.GetUserName();
            if (UserName != "")
            {
                return View(db.Carts.Where(c => c.UserName == UserName).ToList());
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        
        
        // GET: Cart_User/Delete/5
        public ActionResult Delete(long? id)
        {
            Cart Cart_User = db.Carts.Find(id);
            db.Carts.Remove(Cart_User);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // POST: Cart_User/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Product Cart_User = db.Products.Find(id);
            db.Products.Remove(Cart_User);
            db.SaveChanges();
            return RedirectToAction("Index", "Cart_User");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

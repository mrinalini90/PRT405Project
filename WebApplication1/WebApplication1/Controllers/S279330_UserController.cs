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
    public class S279330_UserController : Controller
    {
        private PRT405_2017SEM1Entities db = new PRT405_2017SEM1Entities();
        AccountController a = new AccountController();

        // GET: S279330_User
        public ActionResult Index()
        {
            string UserName = User.Identity.GetUserName();
            if (UserName != "")
            {
                return View(db.Products.ToList());
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // GET: S279330_User/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product s279330_User = db.Products.Find(id);
            if (s279330_User == null)
            {
                return HttpNotFound();
            }
            return View(s279330_User);
        }

        // GET: S279330_User/Create
        public ActionResult Create()
        {
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString());
            //con.Open();
            //SqlCommand cmd = new SqlCommand("select id from AspNetUsers where Email='"+User.Identity.Name+"'");
            
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //con.Close();
            //string UserID=ds.Tables[0].Rows[0].ToString();
            return View();
        }

        // POST: S279330_User/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductId,ProductName,ProductCategory,ProductDescription,ProductPrice,UserName")] Product s279330_User)
        {
                if (ModelState.IsValid)
            {
                db.Products.Add(s279330_User);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(s279330_User);
        }

        // GET: S279330_User/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product s279330_User = db.Products.Find(id);
            if (s279330_User == null)
            {
                return HttpNotFound();
            }
            return View(s279330_User);
        }

        // POST: S279330_User/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductId,ProductName,ProductCategory,ProductDescription,ProductPrice,UserName")] Product s279330_User)
        {
            if (ModelState.IsValid)
            {
                db.Entry(s279330_User).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(s279330_User);
        }

        // GET: S279330_User/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product s279330_User = db.Products.Find(id);
            if (s279330_User == null)
            {
                return HttpNotFound();
            }
            return View(s279330_User);
        }

        // POST: S279330_User/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Product s279330_User = db.Products.Find(id);
            db.Products.Remove(s279330_User);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult AddToCart(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            Cart cart =new Cart();
            cart.ProductId = product.ProductId;
            cart.ProductName = product.ProductName;
            cart.ProductPrice = (decimal)product.ProductPrice;
            cart.UserName = User.Identity.Name;

            if (product == null)
            {
                return HttpNotFound();
            }
            else
            {
                db.Carts.Add(cart);
                db.SaveChanges();
                return RedirectToAction("Index","Cart_User");
            }
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

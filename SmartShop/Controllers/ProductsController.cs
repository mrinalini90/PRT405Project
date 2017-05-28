using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using E_Corp;

namespace E_Corp.Controllers
{
    
    public class ProductsController : Controller
    {
        private S295076_MinhThuanTranEntities db = new S295076_MinhThuanTranEntities();

        // GET: Products
        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId(); //get current userID

            if (User.IsInRole("Seller")) //if the user is a seller then view only theirs
                return View(db.Products.Where(b => b.SellerID == userId).ToList());

            return View(db.Products.ToList()); //view all

        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        [Authorize]
        // GET: Products/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create([Bind(Include = "ProductID,SellerID,ProductName,ProductDescription,Quanlity,Price,Enable")] Product product)
        {
            if (ModelState.IsValid)
            {
                var userId = User.Identity.GetUserId(); //get current userID
                product.SellerID = userId; //assign to new record

                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(product);
        }

        [Authorize]
        // GET: Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]

        [Authorize]
        public ActionResult Edit([Bind(Include = "ProductID,SellerID,ProductName,ProductDescription,Quanlity,Price,Enable")] Product product)
        {
            if (ModelState.IsValid)
            {
                var userId = User.Identity.GetUserId(); //get current userID
                product.SellerID = userId; //assign to new record

                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(product);
        }

        [Authorize]
        // GET: Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        [Authorize]
        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
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

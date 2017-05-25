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
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;

namespace WebApplication1.Controllers
{
    [Authorize]
    public class PeopleController : Controller
    {
        private PRT405_2017SEM1Entities db = new PRT405_2017SEM1Entities();

        // GET: People
        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId();
            if(userId == "admin@admin.com")
            {
                return View(db.Products.ToList());
            }
            var returnList = db.Products.Where(x => x.UserName == userId).ToList();
            return View(returnList);
        }

        // GET: People/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var userDetails = this.HttpContext.User.Identity.Name;
            var userId = User.Identity.GetUserId();


            Product s279330_User = db.Products.Find(id);
            if (s279330_User == null)
            {
                return HttpNotFound();
            }
            return View(s279330_User);
        }

        // GET: People/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: People/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,UserId,CarName,Details,Address")] Product s279330_User)
        {
            if (ModelState.IsValid)
            {
                var userDetails = this.HttpContext.User.Identity.Name;
                var userId = User.Identity.GetUserId();

                s279330_User.ProductName = userId;

                db.Products.Add(s279330_User);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(s279330_User);
        }

        // GET: People/Edit/5
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

        // POST: People/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,UserId,CarName,Details,Address")] Product s279330_User)
        {
            if (ModelState.IsValid)
            {
                db.Entry(s279330_User).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(s279330_User);
        }

        // GET: People/Delete/5
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

        // POST: People/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Product s279330_User = db.Products.Find(id);
            db.Products.Remove(s279330_User);
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

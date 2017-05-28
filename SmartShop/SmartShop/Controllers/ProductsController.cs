using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Mvc;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using SmartShop.Models;

namespace SmartShop.Controllers
{
   
    public class ProductsController : BaseApiController
    {

        // GET: api/Products
        [System.Web.Http.Route("api/Products")]
        public HttpResponseMessage GetProducts()
        {
            IEnumerable<Product> prod ;
            var admin = User.Identity.GetUserName();
            if (admin == "admin@admin.com")
            {
                var currentUser = User.Identity.GetUserId();

                if (User.Identity.IsAuthenticated == true)
                {
                    currentUser = User.Identity.GetUserId();
                }

                prod = Db.Products;
            }
            else
            {
                var currentUser = User.Identity.GetUserId();

                if (User.Identity.IsAuthenticated == true)
                {
                    currentUser = User.Identity.GetUserId();
                }

                prod = Db.Products.Where(x => x.UserID == currentUser);
            }
            return ToJson(prod.AsEnumerable());
        }

        // GET: api/Products/5
        [ResponseType(typeof(Product))]
        [System.Web.Http.Route("api/Products/{id:int}")]
        public HttpResponseMessage GetProduct(int id)
        {

            Product product = Db.Products.Find(id);

            if (product == null)
            {
               Debug.WriteLine("Product Not Found");
            }
            return ToJson(product);
        }

        // PUT: api/Products/5
        [ResponseType(typeof(void))]
        
        [System.Web.Http.HttpPut]
        [System.Web.Http.Route("api/UpdateProduct")]
        public HttpResponseMessage PutProduct([FromBody] Product product)
        {
            product.UserID = User.Identity.GetUserId();
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            if (product.ProductId != product.ProductId)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest,"Product Id is invalid");
            }
            

            Db.Entry(product).State = EntityState.Modified;

            try
            {
                Db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(product.ProductId))
                {
                    throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.NotFound));
                }
                else
                {
                    throw;
                }
            }
            return Request.CreateResponse(HttpStatusCode.OK);
        }

        // POST: api/Products
        [ResponseType(typeof(Product))]
        [System.Web.Http.HttpPost]
        [System.Web.Http.Route("api/AddProduct")]
        public HttpResponseMessage PostProduct([FromBody] Product product)
        {
            product.UserID = User.Identity.GetUserId();
            Db.Products.Add(product);
            Db.SaveChanges();
            CreatedAtRoute("DefaultApi", new {id = product.ProductId}, product);
            return Request.CreateResponse(HttpStatusCode.OK);
        }

        // DELETE: api/Products/5
        [ResponseType(typeof(Product))]
        [System.Web.Http.HttpDelete]
        [System.Web.Http.Route("api/DeleteProduct/{id:int}")]
        public IHttpActionResult DeleteProduct(int id)
        {
            Product product = Db.Products.Find(id);
            if (product == null)
            {
                return NotFound();
            }

            Db.Products.Remove(product);
            Db.SaveChanges();

            return Ok(product);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                Db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductExists(int id)
        {
            return Db.Products.Count(e => e.ProductId == id) > 0;
        }

       
    }
}
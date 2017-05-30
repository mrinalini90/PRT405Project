using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Microsoft.AspNet.Identity;
using SmartShop.Models;

namespace SmartShop.Controllers
{
    public class CartsController : BaseApiController
    {
        private SmartShopEntities db = new SmartShopEntities();
        
    // GET: api/Carts
    [Route("api/Carts")]
        public HttpResponseMessage GetCarts()
        {
            return ToJson(db.Carts.AsEnumerable());
            
        }

        // GET: api/Carts/5
        [ResponseType(typeof(Cart))]
        [System.Web.Http.Route("api/Carts/{id:int}")]
        public HttpResponseMessage GetCart(int id)
        {
            Cart cart = db.Carts.Find(id);
            if (cart == null)
            {
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.NotFound));
            }

            return ToJson(cart);
        }

        // PUT: api/Carts/5
        [ResponseType(typeof(void))]
        [System.Web.Http.HttpPut]
        [System.Web.Http.Route("api/UpdateCart")]
        public HttpResponseMessage PutCart([FromBody] Cart cart)
        {
            cart.UserID = User.Identity.GetUserId();
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            if (cart.CartId != cart.CartId)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Product Id is invalid");
            }

            db.Entry(cart).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CartExists(cart.CartId))
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

        // POST: api/Carts
        [ResponseType(typeof(Cart))]
        [Route("api/AddCarts")]
        public HttpResponseMessage PostCart([FromBody] Cart cart)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            db.Carts.Add(cart);
            db.SaveChanges();
            CreatedAtRoute("DefaultApi", new { id = cart.CartId }, cart);
            return Request.CreateResponse(HttpStatusCode.OK);
        }

        // DELETE: api/Carts/5
        [ResponseType(typeof(Cart))]
        [System.Web.Http.HttpDelete]
        [System.Web.Http.Route("api/DeleteCart/{id:int}")]
        public IHttpActionResult DeleteCart(int id)
        {
            Cart cart = db.Carts.Find(id);
            if (cart == null)
            {
                return NotFound();
            }

            db.Carts.Remove(cart);
            db.SaveChanges();

            return Ok(cart);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CartExists(int id)
        {
            return db.Carts.Count(e => e.CartId == id) > 0;
        }
    }
}
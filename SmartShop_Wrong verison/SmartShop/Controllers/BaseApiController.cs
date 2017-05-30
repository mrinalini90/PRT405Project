using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;
using Newtonsoft.Json;
using SmartShop.Models;

namespace SmartShop.Controllers
{
    public class BaseApiController : ApiController
    {
        public SmartShopEntities Db = new SmartShopEntities();
        public HttpResponseMessage ToJson(dynamic obj)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK);
            JsonConvert.DefaultSettings = () => new JsonSerializerSettings
            {
                Formatting = Newtonsoft.Json.Formatting.Indented,
                ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
            };
            response.Content = new StringContent(JsonConvert.SerializeObject(obj));
          
            return response;
        }
    }
}

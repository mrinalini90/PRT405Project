using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SmartShop.Startup))]
namespace SmartShop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

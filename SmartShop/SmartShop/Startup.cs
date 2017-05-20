using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Smartshop.Startup))]
namespace Smartshop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

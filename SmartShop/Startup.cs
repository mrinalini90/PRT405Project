using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(E_Corp.Startup))]
namespace E_Corp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

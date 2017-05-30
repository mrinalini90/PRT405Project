using System.Web;
using System.Web.Optimization;

namespace SmartShop
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new ScriptBundle("~/bundles/angular").Include(
                "~/Scripts/angular.js",
                "~/Scripts/angular-route.js"));

            bundles.Add(new ScriptBundle("~/bundles/materialize").Include(
                "~/Scripts/materialize/materialize.js",
                "~/Scripts/Custom.js"));

            bundles.Add(new ScriptBundle("~/bundles/angularJs").Include(
                "~/Scripts/ApiScript/Module.js",
                "~/Scripts/ApiScript/Route.js",
                "~/Scripts/ApiScript/Service.js",
                "~/Scripts/ApiScript/Controller.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                //"~/Content/materialize/css/materialize.css",
                      "~/Content/site.css"
               // "~/Content/bootstrap/'*'.less"
               ));
        }
    }
}

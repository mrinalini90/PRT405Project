var app;
(function () {
    app = angular.module("SmartShopModule", ["ngRoute"]);
})();
app.config(function ($routeProvider) {
    $routeProvider
        .when("/",
            {
                templateUrl: "Product/Index",
                controller: 'ProductController'
            })
        .when("/ViewProduct",
            {
                templateUrl: "Product/ViewProduct.html",
                controller: 'ProductController'
            });

});

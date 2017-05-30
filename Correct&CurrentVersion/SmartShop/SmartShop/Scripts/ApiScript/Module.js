var app;
(function () {
    app = angular.module("SmartShopModule", ['ngRoute']);
})();
var configFunction = function($routeProvider, $locationProvider) {
    $routeProvider.when('/',
            {
                templateUrl: 'Product/Index'
            })
        .when('/viewProduct',
            {
                templateUrl: 'Product/ViewProduct'
            });
    $locationProvider.hashPrefix('#!').html5Mode(true);
};
configFunction.$inject = ['$routeProvider','$locationProvider'];

app.config(configFunction);
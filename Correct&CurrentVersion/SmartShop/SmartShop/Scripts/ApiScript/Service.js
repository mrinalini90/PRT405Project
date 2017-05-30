app.service("SmartShopService", function ($http) {
    this.getProducts = function() {
        return $http.get("api/Products");
    };

    this.getBuyingProducts = function () {
        return $http.get("api/BuyingProducts");
    };

    this.getProduct = function(id) {
        return $http.get("api/Products/"+id);
    };

    this.AddProduct = function(prod) {
        return $http(
            {
                method: 'post',
                data: prod,
                dataType: 'json',
                url: 'api/AddProduct'
            });
    };

    this.UpdateProduct = function (prod) {
        return $http(
            {
                method: 'put',
                data: prod,
                dataType: 'json',
                url: 'api/UpdateProduct'
            });
    };

    this.DeleteProduct = function (id) {
        return $http.delete('api/DeleteProduct/'+id);
    };


    this.AddCartItem = function(item) {
        return $http(
            {
                method: 'post',
                data: item,
                dataType: 'json',
                url: 'api/AddCarts'
            });
    };

    this.DeleteCartItem = function(id) {
        return $http.delete('api/DeleteCartItem/' + id);
    };

    this.GetCarts = function () {
        return $http.get("api/Carts");
    };

    this.AddOrder = function (order) {
        return $http(
            {
                method: 'post',
                data: order,
                dataType: 'json',
                url: 'api/Orders'
            });
    };
}); 
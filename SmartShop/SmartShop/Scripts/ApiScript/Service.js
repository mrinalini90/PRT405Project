app.service("SmartShopService", function ($http) {
    this.getProducts = function() {
        return $http.get("api/Products");
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
    }
}); 
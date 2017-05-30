app.controller("SmartShopController",
    function($scope, $routeParams, $location, SmartShopService) {
        getAll();
        getBuyingProducts();

        //get all product function
        function getAll() {
            var servCall = SmartShopService.getProducts();
            servCall.then(function(d) {
                    $scope.product = d.data;
                },
                function(error) {
                    $log.error("Oops! Something went wrong while fetching the data." + error.data.ExceptionInformation);
                });
        }

        //get all products to be sold
        function getBuyingProducts() {
            var servCall = SmartShopService.getBuyingProducts();
            servCall.then(function(d) {
                    $scope.buyingProduct = d.data;
                },
                function(error) {
                    $log.error("Oops! Something went wrong while fetching the data." + error.data.ExceptionInformation);
                });
        }


        //get product by id function
        function getSellingProductById(id) {
            var servCall = SmartShopService.getProduct(id);
            servCall.then(function(d) {
                    $scope.singleProduct = d.data;
                    $scope.updateId = $scope.singleProduct.ProductId;
                    $scope.updateName = $scope.singleProduct.ProductName;
                    $scope.updateCategory = $scope.singleProduct.ProductCategory;
                    $scope.updateDescription = $scope.singleProduct.ProductDescription;
                    $scope.updatePrice = $scope.singleProduct.ProductPrice;
                    $scope.updateQuantity = $scope.singleProduct.ProductQuantity;
                    $scope.UpdateStatus = $scope.singleProduct.ProductStatus;
                    var update = $scope.UpdateStatus;
                    if (update === true) {
                        $("#UpdateStatus").prop("checked", checked);
                    }
                    $("#sellingModal").modal();
                },
                function(error) {
                    $log.error("Oops! Something went wrong while fetching the Product" +
                        error.data.ExceptionInformation);
                });
        }


        $scope.getBuyingProductId = function(id) {
            var prod = id;
            getBuyingProductById(id);
        };

        $scope.getSellingProductId = function(id) {
            var prod = id;
            getSellingProductById(id);
        };

        function getBuyingProductById(id) {
            var servCall = SmartShopService.getProduct(id);
            servCall.then(function(d) {
                    $scope.singleProduct = d.data;
                    $scope.updateId = $scope.singleProduct.ProductId;
                    $scope.updateName = $scope.singleProduct.ProductName;
                    $scope.updateCategory = $scope.singleProduct.ProductCategory;
                    $scope.updateDescription = $scope.singleProduct.ProductDescription;
                    $scope.updatePrice = $scope.singleProduct.ProductPrice;
                    $scope.updateQuantity = $scope.singleProduct.ProductQuantity;
                    $("#ViewModal").modal();
                },
                function(error) {
                    $log.error("Oops! Something went wrong while fetching the Product" +
                        error.data.ExceptionInformation);
                });
        }

     

        // add product function
        $scope.addProduct = function() {
            var prod = {
                ProductName: $scope.ProductName,
                ProductCategory: $scope.ProductCategory,
                ProductDescription: $scope.ProductDescription,
                ProductPrice: $scope.ProductPrice,
                ProductQuantity: $scope.ProductQuantity,
                ProductStatus: "False",
                UserId: $scope.product.userId
            };
            var addProduct = SmartShopService.AddProduct(prod);
            addProduct.then(function(d) {
                    getAll();
                    getBuyingProducts();
                },
                function(error) {
                    console.log("Oops! Something went wrong while saving the data." + error.data.ExceptionInformation);
                });
        };

        //View Update button
        $scope.enableEdit = function() {
            $scope.disable = false;
            $scope.updateButton = true;
        };

        //View Delete button
        $scope.enableDelete = function() {
            $scope.deleteButton = true;
        };

        //update function
        $scope.updateProduct = function() {
            var status;
            if ($scope.updateStatus === true) {
                status = true;
            } else {
                status = false;
            }
            var prod = {
                ProductId: $scope.updateId,
                ProductName: $scope.updateName,
                ProductCategory: $scope.updateCategory,
                ProductDescription: $scope.updateDescription,
                ProductPrice: $scope.updatePrice,
                ProductQuantity: $scope.updateQuantity,
                ProductStatus: status
            };
            var updateProduct = SmartShopService.UpdateProduct(prod);
            $scope.disable = true;
            $scope.updateButton = false;
            updateProduct.then(function() {

                    alert("The data has been updated");

                    getAll();
                    getBuyingProducts();
                },
                function(error) {
                    console.log("Oops! Something went wrong while saving the data." + error.data.ExceptionInformation);
                });
        };


        //delete function
        $scope.deleteProduct = function() {
            var id = $scope.updateId;
            deletCartItem(id);

        };

        function deletCartItem(id) {
            var deleteCartItems = SmartShopService.DeleteCartItem(id);
            deleteCartItems.then(function(d) {
                    var deleteProduct = SmartShopService.DeleteProduct(id);
                    $scope.deleteButton = false;
                    deleteProduct.then(function(d) {
                            getAll();
                            getBuyingProducts();
                        },
                        function(error) {
                            console.log("Oops! Something went wrong while saving the data." +
                                error.data.ExceptionInformation);
                        });
                },
                function(error) {
                    console.log("Oops! Something went wrong while saving the data." + error.data.ExceptionInformation);
                });
        }

        // Add to Cart 
        $scope.AddToCart = function(id) {
            var product = SmartShopService.getProduct(id);
            product.then(function(d) {
                    var item = {
                        Quantity: 1,
                        TotalAmount: d.data.ProductPrice,
                        UserID: d.data.UserID,
                        ProductId: d.data.ProductId,
                        ProductName: d.data.ProductName
                    };
                    addCartItem(item);
                    updateProduct(d.data.ProductId);
                },
                function(error) {
                    console.log("Oops! Something went wrong while saving the data." + error.data.ExceptionInformation);
                });
        };

        //Modal Function
        $scope.CartModal = function () {
            var cart = SmartShopService.GetCarts();
            cart.then(function (d) {
                    $scope.cartItem = d.data;
                    $("#CartModal").modal();
                },
                function (error) {
                    $log.error("Oops! Something went wrong while fetching the Product" +
                        error.data.ExceptionInformation);
                });
        };

        function getCartItem() {
            var cart = SmartShopService.GetCarts();
            cart.then(function (d) {
                    $scope.cartItem = d.data;

                },
                function (error) {
                    $log.error("Oops! Something went wrong while fetching the Product" +
                        error.data.ExceptionInformation);
                });
        };


        function addCartItem(item) {
            var servCall = SmartShopService.AddCartItem(item);
            servCall.then(function(d) {
                },
                function(error) {
                    $log.error("Oops! Something went wrong while fetching the data." + error.data.ExceptionInformation);
                });
        }

        function updateProduct(id) {
            var servCall = SmartShopService.getProduct(id);
            servCall.then(function(d) {
                    if (d.data.ProductQuantity >= 1) {
                        d.data.ProductQuantity = d.data.ProductQuantity - 1;
                    } else {
                        d.data.ProductQuantity = 0;
                    }
                    var prod = {
                        ProductId: d.data.ProductId,
                        ProductName: d.data.ProductName,
                        ProductCategory: d.data.ProductCategory,
                        ProductDescription: d.data.ProductDescription,
                        ProductPrice: d.data.ProductPrice,
                        ProductQuantity: d.data.ProductQuantity,
                        ProductStatus: d.data.ProductStatus,
                        UserId: d.data.userId
                    };
                    var updateProduct = SmartShopService.UpdateProduct(prod);
                    updateProduct.then(function() {
                            getAll();
                            getBuyingProducts();
                        },
                        function(error) {
                            console.log("Oops! Something went wrong while saving the data." +
                                error.data.ExceptionInformation);
                        });
                },
                function(error) {
                    console.log("Oops! Something went wrong while saving the data." +
                        error.data.ExceptionInformation);
                });
        }


        $scope.AddOrder = function () {

            var cart = SmartShopService.GetCarts();
            cart.then(function(d) {
                    for (var id in d) {
                      
                        deleteCartItem(id.data.CartId);

                    }
                    alert("Order Sucessful");
                    getCartItem();
                },
                function(error) {
                    console.log("Oops! Something went wrong while saving the data." +
                        error.data.ExceptionInformation);
                });
        };

        function addSingleOrder(data) {
            var addOrder = SmartShopService.AddOrder(data);
            addOrder.then(function() {
                },
                function(error) {
                    console.log("Oops! Something went wrong while saving the data." +
                        error.data.ExceptionInformation);
                });
        }

        function deleteCartItem(id) {
            var deleteCartItems = SmartShopService.DeleteCartItem(id);
            deleteCartItems.then(function() {

                },
                function(error) {
                    console.log("Oops! Something went wrong while saving the data." +
                        error.data.ExceptionInformation);
                });
        }

    });

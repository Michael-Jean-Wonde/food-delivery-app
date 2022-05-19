import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;


  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems +_quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    print(response.statusCode);
    if(response.statusCode==200){
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
     // print(_popularProductList);
     _isLoaded = true;
      update();
    }else{
      print('got no products');
    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
      //print('number of items '+_quantity.toString());
    }else{
      
      _quantity = checkQuantity(_quantity-1);
      //print('number of items '+_quantity.toString());
    }
    update();
  }
  int checkQuantity(int quantity){
    if((_inCartItems+quantity)<0){
      Get.snackbar('Item count', "You can't reduce anymore !",
        backgroundColor: Colors.blue.shade300,
        colorText: Colors.white
      );
      if(_inCartItems>0){
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    }else if ((_inCartItems+quantity)>20){
      Get.snackbar('Item count', "You can't add anymore !",
        backgroundColor: Colors.blue.shade300,
        colorText: Colors.white
      );
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist= false;
    exist = _cart.existInCart(product);
    //get from storage _inCartItems
    print('exist or not '+exist.toString());
    if(exist){
      _inCartItems=_cart.getQuantity(product);
    }
    print('the quantity in the cart is '+_inCartItems.toString());
  }

  void addItem(ProductModel product){
    
      _cart.addItem(product, _quantity);

      _quantity=0;
      _inCartItems = _cart.getQuantity(product);

      _cart.items.forEach((key, value) {
        print('the id is '+value.id.toString()+' the quantity is '+value.quantity.toString());
      });
    
      update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}















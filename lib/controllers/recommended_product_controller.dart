import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;


  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;


  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
     // print(_popularProductList);
     _isLoaded = true;
      update();
    }else{
      print('could not products recommended');
    }
  }
}














// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:food_delivery/data/repository/popular_product_repo.dart';
// import 'package:food_delivery/models/products_model.dart';
// import 'package:food_delivery/utils/app_constants.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class PopularProductController extends GetxController{
//   final PopularProductRepo popularProductRepo;
//   PopularProductController({required this.popularProductRepo});
//   List<dynamic> _popularProductList = [];
//   List<dynamic> get poplarProductList => _popularProductList;

//   Future<void> getPopularProductList() async {
    
//     Response response = await popularProductRepo.getProductList();
    
//     http.Response res = await http.get(Uri.parse(AppConstants.dummyURI));
  
//     print(res.body);
//     print(response.statusCode);
//     if(res.statusCode ==  200){
//        parsedFood(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<String,dynamic>();

//   // return parsed.map<Product>((json) => Product.fromJson(json)).toList();
//   debugPrint(parsed.toString());
//   return parsed;
// }

      
//       _popularProductList=[];
//       _popularProductList.addAll(Product.fromJson(parsedFood(res.body)).products);
     
//       update(); 
//     }else{
      
//     }
//   }
// }
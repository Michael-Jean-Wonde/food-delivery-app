import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init()async{
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}















// import 'package:food_delivery/controllers/popular_product_controller.dart';
// import 'package:food_delivery/data/api/api_client.dart';
// import 'package:food_delivery/data/repository/popular_product_repo.dart';
// import 'package:food_delivery/utils/app_constants.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// Future<void> init()async{
//   //api client
//   Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
//   //repos
//   Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
//   //controllers
//   Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
// }  

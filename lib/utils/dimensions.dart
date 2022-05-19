import 'package:get/get.dart';
class Dimensions{

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //screenHeight/320 = 2.12
  static double pageView = screenHeight/2.12;
  //screenHeight/220 = 3.11
  static double pageViewContainer = screenHeight/3.11;
  //screenHeight/120 = 5.70
  static double pageViewTextContainer = screenHeight/5.70;

  //dinamic height
  static double height10 = screenHeight/68.3;
  static double height15 = screenHeight/48.80;
  static double height20 = screenHeight/34.15;
  static double height30 = screenHeight/24.40;
  static double height45 = screenHeight/14.40;

  //dinamic width
  static double width10 = screenHeight/68.3;
  static double width15 = screenHeight/48.80;
  static double width20 = screenHeight/34.15;
  static double width30 = screenHeight/24.40;  
  //font size
  static double font20 = screenHeight/34.15;
  static double font16 = screenHeight/43.15;
  static double font26 = screenHeight/24.15;
  //radius
  static double radius20 = screenHeight/34.15;
  static double radius30 = screenHeight/24.40;
  static double radius15 = screenHeight/48.80;

  //icon size
  static double iconSize24 = screenHeight/31.17;
  static double iconSize16 = screenHeight/48.75;

  //list view size
  static double listViewImgSize = screenWidth/3.25;
  static double listViewTextContSize = screenWidth/3.9;

  //popular food
  static double popularFoodImgSize = screenHeight/2.61;

  //bottom height
  static double bottomHeightBar = screenHeight/6.60;
}
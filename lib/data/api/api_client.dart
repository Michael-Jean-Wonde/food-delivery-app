import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(String uri,) async {
    try{
      Response response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

}
















// import 'package:food_delivery/utils/app_constants.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class ApiClient extends GetConnect implements GetxService{
//   late String token;
//   final String appBaseUrl;

//   late Map<String, String> _mainHeaders;

//   ApiClient({required this.appBaseUrl}){
//     baseUrl = appBaseUrl;
//     timeout = Duration(seconds: 30);
//     token = AppConstants.TOKEN; 
//     _mainHeaders = {
//       'Content-type': 'application/json; charset = UTF-8',
//       'authorization': 'Bearer $token',
//     };
//   }
//   Future<Response> getData(String url,)async{
//     try{
//       print('before get uri in apiclient');
//       Response response = await get(url);
//       return response;
//     }catch(e){
//       return Response(statusCode: 1, statusText: e.toString());
//     }
//   }
// }
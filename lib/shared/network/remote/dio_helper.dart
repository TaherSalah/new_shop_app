import 'package:dio/dio.dart';

class DioHelper{
 static late Dio dio;

 static init()
 {
  dio=Dio(
   BaseOptions(
    baseUrl: 'https://student.valuxapps.com/api/', ///////// var url ////////////
    receiveDataWhenStatusError: true,
    headers: {   /////////////   دا ثابت في كل المشروع  ///////////
     'Content-Type':'application/json',
    }
   )
  );
 }
 static Future<Response> getData({
  required String url,
  required Map<String,
      dynamic>query,
  String lang ='ar',
  String? token,
 })async{
  dio.options.headers={
   'lang':lang,
   // ignore: unnecessary_null_in_if_null_operators
   'Authorization':token??null
  };
 return await dio.get<dynamic>(url,queryParameters: query);
 }

 static Future <Response> postData ({
  required String url,
  Map<String,dynamic>?query,
  required Map <String,dynamic>data,
  String lang ='ar',
  String? token,
 })async
 {
  dio.options.headers={
   'lang':lang,
   // ignore: unnecessary_null_in_if_null_operators
   'Authorization':token??null
  };
  return await dio.post(
   url,
   queryParameters: query,
   data: data,
  );
 }
}
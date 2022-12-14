import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl:
          'https://student.valuxapps.com/api/', ///////// var url ////////////
      receiveDataWhenStatusError: true,
      // headers: {   /////////////   دا ثابت في كل المشروع  ///////////
      //  'Content-Type':'application/json',
      // }
    ));
  }

  static Future<Response> getData({
    required String url,
    // required Map<String, dynamic>query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      // ignore: unnecessary_null_in_if_null_operators
      'Authorization': token ?? '',
    };
    return await dio.get<dynamic>(
      url,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      // ignore: unnecessary_null_in_if_null_operators
      'Authorization': token ?? '',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
  /////////////  start put data dioHelper ///////
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      // ignore: unnecessary_null_in_if_null_operators
      'Authorization': token ?? '',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}

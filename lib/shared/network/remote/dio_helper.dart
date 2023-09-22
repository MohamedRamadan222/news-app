import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl:'https://wsq-api.fonoq.com/api/v1/articles',
        queryParameters: {'limit': '20'},
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
})async => await dio.get(url, queryParameters: query);
}
import 'package:dio/dio.dart';

class DioHelper {
   static Dio? dio;
   static init({required String url}) {
    dio = Dio(BaseOptions(
        baseUrl: url,
        receiveDataWhenStatusError: true,
        ));
  }
   static Future<Response<dynamic>> getData(
      {required String endPoint,
       Map<String, dynamic>? query,
       Map<String, dynamic>? headers,
      }) async {
      dio!.options.headers = headers??{};
      var result=await dio!.get(endPoint, queryParameters: query);
    return result;
  }

}

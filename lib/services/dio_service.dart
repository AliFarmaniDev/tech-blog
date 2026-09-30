import 'package:dio/dio.dart';

class DioService {
  // create a class for dio
  Dio dio = Dio();

  Future<Response<dynamic>> getMethod(String url) async {
    return dio.get(
      url,
      options: Options(responseType: ResponseType.json, method: 'GET'),
    );
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class DioHelper {
  static final String baseURL = "https://waspha.herokuapp.com/api/v1";
  static final cookieJar = PersistCookieJar();

  static BaseOptions options = BaseOptions(
    baseUrl: baseURL,
    responseType: ResponseType.json,
    receiveDataWhenStatusError: true,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
  static Dio createDio() {
    return Dio(options);
  }

  static Dio addInterceptors(Dio dio) {
    return dio..interceptors.add(CookieManager(cookieJar));
  }

  static final dio = createDio();
  static final dioWithInterceptor = addInterceptors(dio);

  Future<List<Cookie>> getCookies(String url) async {
    return await cookieJar.loadForRequest(Uri.parse(url));
  }

  Future<Response> post(
    String url,
    dynamic data,
  ) async {
    Response response = await dio.post(url, data: data);
    return response;
  }

  Future<Response> get(String url) async {
    try {
      Response response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      print("ERROR: ${e.response?.data}");
      return e.response!;
    }
  }
}

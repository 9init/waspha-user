import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:waspha/src/shared/networking/networking.dart';

class AppInterceptors extends Interceptor {
  final Dio _dio;

  AppInterceptors(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.baseUrl}');
    debugPrint('REQUEST DATA: ${options.data}'); // Add this line to print request data
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.baseUrl}');
    debugPrint(
        'RESPONSE DATA: ${response.data}'); // Add this line to print response data
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.baseUrl}');
    debugPrint('ERROR MESSAGE: ${err.message}'); // Add this line to print error message
    // Check if the error is due to unauthorized access
    if (err.response?.statusCode == 401) {
      // Token is in the cookies
      await Networking.post("resume-access-token", {});
      return handler.resolve(await _dio.fetch(err.requestOptions));
    }
    return handler.next(err);
  }
}

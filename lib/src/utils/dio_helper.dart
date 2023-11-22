import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:waspha/src/utils/cache_helper.dart';

import '../features/login/domain/login_domain.dart';

final dioProvider = Provider<DioHelper>(DioHelper.new);

class DioHelper {
  Ref ref;
  Dio dio;
  DioHelper(this.ref)
      : dio = Dio(options)
          ..interceptors.add(
              InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
            requestInterceptor(options, ref);
            return handler.next(options);
          })) {
    prepareJar();
  }

  static final String baseURL = "https://api.waspha.com/";

  static BaseOptions options = BaseOptions(
    baseUrl: baseURL,
    responseType: ResponseType.json,
    receiveDataWhenStatusError: true,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Future<RequestOptions> requestInterceptor(
      RequestOptions options, Ref ref) async {
    final token = await CacheHelper.getString("accessToken") ??
        ref.watch(accessTokenProvider);
    options.headers.addAll({"Authorization": "Bearer $token"});
    return options;
  }

  Future<PersistCookieJar> prepareJar() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final jar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(appDocPath + "/.cookies/"),
    );
    dio.interceptors.add(CookieManager(jar));
    return jar;
  }

  Future<List<Cookie>> loadCookies(String url) async {
    final cookieJar = await prepareJar();
    return await cookieJar.loadForRequest(Uri.parse(url));
  }

  Future<void> deleteCookies(String url) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    await Directory(appDocPath + "/.cookies/").delete(recursive: true);
    await CacheHelper.remove("accessToken");
    final cookieJar = await prepareJar();
    return await cookieJar.deleteAll();
  }

  Future<Response> post(String url, dynamic data,
      {bool deleteCookie = false}) async {
    Response response = await dio.post(url, data: data);
    if (deleteCookie) {
      await deleteCookies(baseURL);
    }

    return response;
  }

  Future<Response> get(String url, {bool deleteCookie = false}) async {
    try {
      Response response = await dio.get(url);

      if (deleteCookie) {
        await deleteCookies(baseURL);
      }

      return response;
    } on DioError catch (e) {
      print("ERROR: ${e.response?.data}");
      return e.response!;
    }
  }

  Future<Response> delete(String url, {bool deleteCookie = false}) async {
    Response response = await dio.delete(
      url,
    );
    if (deleteCookie) {
      await deleteCookies(baseURL);
    }

    return response;
  }
}

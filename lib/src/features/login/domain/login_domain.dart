import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/utils/cache_helper.dart';
import 'package:waspha/src/utils/dio_helper.dart';

part 'login_domain.g.dart';

final accessTokenProvider = StateProvider<String>((ref) {
  return "";
});

@riverpod
Future sendLog(Ref ref,
    {required String mobile,
    required String password,
    required BuildContext context,
    required bool keepLogin}) async {
  final url = "user/login";
  try {
    var request = await ref.watch(dioProvider).post(url, {
      "user_id": "$mobile",
      "password": "$password",
      "keepLogin": "$keepLogin",
    });
    var response = request.data;
    String message = response["message"];

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
    print("LOGIN RESPONSE: $response");
    if (request.statusCode == 200) {
      String accessToken = response["data"]["access_token"];
      log("Token: $accessToken");
      await CacheHelper.setString("accessToken", accessToken);
      await ref
          .watch(accessTokenProvider.notifier)
          .update((state) => accessToken);
      context.go('/');
    }
  } on DioError catch (e) {
    print("LOGIN ERROR: ${e}");
  }
}

@riverpod
Future<String?> getUserAvatar(Ref ref) async {
  final String url = 'user/profile';
  try {
    final request = await ref.watch(dioProvider).get(url);
    final avatar = request.data["data"]["avatar"];
    return avatar;
  } catch (e) {}
  return null;
}

@riverpod
Future<bool> isLoggedIn(Ref ref) async {
  final String url = 'user/profile';
  try {
    final request = await ref.watch(dioProvider).get(url);
    if (request.statusCode == 200) {
      return true;
    }
  } catch (e) {}
  return false;
}

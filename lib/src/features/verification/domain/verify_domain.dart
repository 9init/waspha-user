import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/utils/dio_helper.dart';

import '../../../constants/constants.dart';
import '../../../utils/cache_helper.dart';
import '../../login/domain/login_domain.dart';

part 'verify_domain.g.dart';

final getEmailProvider = StateProvider<String>((ref) => '');

final userIDProvider = StateProvider<int>((ref) => 0);

@riverpod
Future verifyOTP(
  Ref ref, {
  required String otp,
  required BuildContext context,
}) async {
  final url = "$restAPI/user/signup";

  try {
    var request = await ref.watch(dioProvider).post(
        url,
        json.encode({
          "email": ref.watch(getEmailProvider),
          "otp": otp,
        }));
    var response = request.data;
    String message = response["message"];

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
    
      String accessToken = response["data"]["access_token"];
      print(accessToken);
      await CacheHelper.setString("accessToken", accessToken);
      await ref
          .watch(accessTokenProvider.notifier)
          .update((state) => accessToken);
      context.go('/');
    
  } catch (e) {}
}

final resendOTPProvider = FutureProvider((ref) async {
  final url = "user/resend-otp";
  final email = ref.watch(getEmailProvider);

  try {
    var request = await ref.watch(dioProvider).post(
        url,
        json.encode({
          "user_id": email,
        }));
    var response = request.data;
    print("Resend OTP: $response");
  } on DioError catch (e) {
    print(e.response!.data);
  }
});

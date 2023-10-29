import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/features/verification/domain/verify_domain.dart';
import 'package:waspha/src/utils/dio_helper.dart';

part 'register_domain.g.dart';

@riverpod
Future sendRegister(
  Ref ref, {
  required String userName,
  required String email,
  required String countryCode,
  required String phoneNumber,
  required String password,
  required String fullNumber,
  required BuildContext context,
}) async {
  final url = "user/signup-request";

  try {
    var request = await ref.watch(dioProvider).post(
        url,
        json.encode({
          "name": userName,
          "email": email,
          "contact": {
            "country_code": countryCode,
            "phone_number": phoneNumber,
            "number": fullNumber
          },
          "password": password,
          "language": "en"
        }));
    var response = request.data;
    String message = response["message"];

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
    print(response);

    // String accessToken = response["data"]["access_token"];
    // print(accessToken);
    // await CacheHelper.setString("accessToken", accessToken);
    // await ref
    //     .watch(accessTokenProvider.notifier)
    //     .update((state) => accessToken);
    var otp = response["data"]["otp"];
    print(otp);
    context.goNamed('Verification OTP', extra: fullNumber);
    await ref.watch(getEmailProvider.notifier).update((state) => email);
    int userID = response["data"]["id"];
    await ref.watch(userIDProvider.notifier).update((state) => userID);
  } on DioError catch (e) {
    print(e.response?.data);
    String message = e.response?.data["message"];
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}

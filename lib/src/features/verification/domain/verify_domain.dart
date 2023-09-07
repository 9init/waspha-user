import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/utils/dio_helper.dart';

import '../../../constants/constants.dart';

part 'verify_domain.g.dart';

final getEmailProvider = StateProvider<String>((ref) => '');

@riverpod
Future verifyOTP(
  Ref ref, {
  required String otp,
  required BuildContext context,
}) async {
  final url = "$restAPI/user/signup";

  try {
    var request = await DioHelper().post(
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
    print(response);
    if (request.statusCode == 200) {
      // String accessToken = response["data"]["access_token"];
      // print(accessToken);
      // await CacheHelper.setString("accessToken", accessToken);
      // await ref
      //     .watch(accessTokenProvider.notifier)
      //     .update((state) => accessToken);
      context.go('/');
    }
  } catch (e) {}
}

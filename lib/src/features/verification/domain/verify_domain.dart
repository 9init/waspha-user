import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/constants.dart';
import '../../nearby_stores/domain/stores_repository.dart';

part 'verify_domain.g.dart';

final getEmailProvider = StateProvider<String>((ref) => '');


@riverpod
Future verifyOTP(
  Ref ref, {
  required String otp,
  required BuildContext context,
}) async {
  final url = "$restAPI/user/signup";

  var request = await client.post(Uri.parse(url),
      body: json.encode({
        "email": ref.watch(getEmailProvider),
        "otp": otp,
      }));
  var response = json.decode(request.body);
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
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/features/verification/domain/verify_domain.dart';

import '../../../constants/constants.dart';
import '../../nearby_stores/domain/stores_repository.dart';

part 'register_domain.g.dart';

@riverpod
Future sendRegister(
  Ref ref, {
  required String name,
  required String email,
  required String countryCode,
  required String phoneNumber,
  required String password,
  required String fullNumber,
  required BuildContext context,
}) async {
  final url = "$restAPI/user/signup-request";

  var request = await client.post(Uri.parse(url),
      body: json.encode({
        "name": name,
        "email": email,
        "contact": {
          "country_code": countryCode,
          "phone_number": phoneNumber,
          "number": fullNumber
        },
        "password": password,
        "language": "en"
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
    var otp = response["data"]["otp"];
    print( otp);
    context.goNamed('Verification OTP', extra: fullNumber);
    await ref.watch(getEmailProvider.notifier).update((state) => email);
  }
}

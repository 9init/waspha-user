import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

part 'register_domain.g.dart';

final getEmailProvider = StateProvider<String>((ref) => '');

final userIDProvider = StateProvider<int>((ref) => 0);

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
  final url = "/signup-request";
  final payload = {
    "name": userName,
    "email": email,
    "contact": {
      "country_code": countryCode,
      "phone_number": phoneNumber,
      "number": fullNumber
    },
    "password": password,
    "language": "en"
  };

  final result = await Networking.post(url, payload);
  switch (result) {
    case Success(value: final value):
      final response = value.data;
      debugPrint(response);
      String message = response["message"];

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));

      final otp = response["data"]["otp"];
      debugPrint(otp);
      context.goNamed('Verification OTP', extra: fullNumber);
      await ref.watch(getEmailProvider.notifier).update((state) => email);
      final int userID = response["data"]["id"];
      await ref.watch(userIDProvider.notifier).update((state) => userID);
      break;
    case Failure(failure: final failure):
      debugPrint(failure.response?.data);
      String message = failure.response?.data["message"];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
      break;
    case Error():
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Something went wrong"),
      ));
      break;
  }
}

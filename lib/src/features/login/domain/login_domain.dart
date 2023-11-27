import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';
import 'package:waspha/src/utils/cache_helper.dart';

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
  final url = "/login";
  final result = await Networking.post(url, {
    "user_id": mobile,
    "password": password,
    "keepLogin": keepLogin.toString(),
  });

  final response = switch (result) {
    Success(value: final value) => value.data,
    Failure() => null,
    Error() => null
  };

  if (response == null) {
    debugPrint("LOGIN ERROR");
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(response["message"]),
  ));
  final accessToken = response["data"]["access_token"];
  debugPrint("Token: $accessToken");
  await CacheHelper.setString("accessToken", accessToken);
  ref.watch(accessTokenProvider.notifier).update((state) => accessToken);
  context.go('/');
}

@riverpod
Future<String?> getUserAvatar(Ref ref) async {
  final url = '/profile';
  final result = await Networking.get(url);

  return switch (result) {
    Success(value: final value) => value.data["data"]["avatar"],
    Failure() => null,
    Error() => null,
  };
}

@riverpod
Future<bool> isLoggedIn(Ref ref) async {
  final url = '/profile';
  final result = await Networking.get(url);

  return switch (result) {
    Success() => true,
    Failure() => false,
    Error() => false,
  };
}

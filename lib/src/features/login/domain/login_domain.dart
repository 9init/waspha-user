import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/utils/cache_helper.dart';

import '../../../constants/constants.dart';
import '../../nearby_stores/domain/stores_repository.dart';

part 'login_domain.g.dart';

final accessTokenProvider = StateProvider<String>((ref) {
  return "";
});

@riverpod
Future sendLog(Ref ref,
    {required String mobile,
    required String password,
    required BuildContext context,
    bool keepLogin = false}) async {
  final url = "$restAPI/user/login";

  var request = await client.post(Uri.parse(url), body: {
    "user_id": "$mobile",
    "password": "$password",
    "keepLogin": "$keepLogin",
  });
  var response = json.decode(request.body);
  String message = response["message"];

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));

  if (request.statusCode == 200) {
    String accessToken = response["data"]["access_token"];
    print(accessToken);
    await CacheHelper.setString("accessToken", accessToken);
    await ref
        .watch(accessTokenProvider.notifier)
        .update((state) => accessToken);
    context.go('/');
  }
}

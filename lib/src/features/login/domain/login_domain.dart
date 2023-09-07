
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/utils/cache_helper.dart';
import 'package:waspha/src/utils/dio_helper.dart';

import '../../../constants/constants.dart';

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

  try {
    var request = await DioHelper().post(url, {
      "user_id": "$mobile",
      "password": "$password",
      "keepLogin": "$keepLogin",
    });
    var response = request.data;
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
  } catch (e) {}
}

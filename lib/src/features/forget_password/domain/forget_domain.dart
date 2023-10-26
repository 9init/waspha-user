import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/utils/dio_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forget_domain.g.dart';

@riverpod
Future forgetPassword(Ref ref,
    {required String user_id, required BuildContext context}) async {
  final String url = 'user/forget-password';
  try {
    final request =
        await ref.watch(dioProvider).post(url, {"user_id": user_id});
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(request.data["message"]),
    ));
    return request.data;
  } catch (e) {}
}

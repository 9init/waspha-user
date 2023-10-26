import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/utils/dio_helper.dart';

final getNotificationProvider = FutureProvider.family((ref,BuildContext context) async {
  final String url = 'user/notification-listing';
  try {
    final response = await ref.read(dioProvider).post(url, {});
    if (response.statusCode == 403) {
      context.go("/login");
    }
    return response.data["data"];
  } catch (e) {}
});

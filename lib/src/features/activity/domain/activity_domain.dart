import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/activity/presentation/activity.dart';
import 'package:waspha/src/utils/dio_helper.dart';

final getRFPListingProvider =
    FutureProvider.family((ref, BuildContext context) async {
  const url = 'user/my-rfp-listing';
  final option = ref.watch(activityProvider);
  try {
    final request = await ref.watch(dioProvider).post(url, {'status': option});
    final response = request.data["data"];
    print("ST: ${request.statusCode}");
    return response;
  } on DioError catch (e) {
    print("ST ERROR: ${e.response?.statusCode}");
    if (e.response?.statusCode == 403) {
    }
  }
});

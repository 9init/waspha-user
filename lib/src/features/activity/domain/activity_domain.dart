import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/activity/presentation/activity.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

final getRFPListingProvider =
    FutureProvider.family((ref, BuildContext context) async {
  const url = '/my-orders-listing';
  final option = ref.watch(activityProvider);

  final result = await Networking.post(url, {'status': option});
  final response = switch (result) {
    Success(value: final value) => value.data["data"],
    Failure() => null,
    Error() => null,
  };
  if (response != null) return response;
});

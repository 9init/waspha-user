import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

final getNotificationProvider =
    FutureProvider.family((ref, BuildContext context) async {
  final String url = '/notification-listing';
  final result = await Networking.post(url, {});

  switch (result) {
    case Success(value: final value):
      return value.data["data"];
    case Failure(failure: final failure):
      if (failure.response?.statusCode == 403) context.go("/login");
      return [];
    case Error(exception: final e):
      throw e;
  }
});

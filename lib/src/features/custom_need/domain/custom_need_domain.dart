import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

import '../../../widgets/nearby_store/nearby_store_widget.dart';
import '../../nearby_stores/domain/stores_repository.dart';

part 'custom_need_domain.g.dart';

@riverpod
Future<int> createRFP(
  Ref ref, {
  required List<Map<String, dynamic>> items,
  required BuildContext context,
  String type = "delivery",
}) async {
  const url = "/create-rfp";
  final location = await ref.watch(userLocationProvider.future);

  final result = await Networking.post(
    url,
    {
      "subcategory_id": ref.watch(subCategoryIDProvider),
      "delivery_location": {
        "address": "4K Chowrangi",
        "lat": location!.latitude,
        "lng": location.longitude,
      },
      "delivery_mode_id": 3,
      "type": type,
      "items": items,
    },
  );

  return switch (result) {
    Success(value: final value) => value.data["data"]["id"],
    Failure() => -1,
    Error() => -1,
  };
}

enum QueueStatus {
  QUEUE_STOPPED,
  EXPIRED,
  REJECTED,
  CANCELLED,
  REQUIRE_QUEUE,
  CURRENT,
  UPCOMING
}

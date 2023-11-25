import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio_helper.dart';
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
  const url = "user/create-rfp";
  final location = await ref.watch(userLocationProvider.future);

  try {
    final request = await ref.watch(dioProvider).post(
        url,
        json.encode({
          "subcategory_id": ref.watch(subCategoryIDProvider),
          "delivery_location": {
            "address": "4K Chowrangi",
            "lat": location!.latitude,
            "lng": location.longitude,
          },
          "delivery_mode_id": 3,
          "type": type,
          "items": items,
        }));
    print(request.data);
    return request.data["data"]["id"];
  } on DioError catch (e) {
    print("Custom Need ${e.response?.data}");
  }
  return -1;
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

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

import '../../nearby_stores/domain/stores_repository.dart';
import '../data/buffer_data.dart';

part 'buffer_brand_domain.g.dart';

@riverpod
Future<List<CancelReason>> getCancelReasons(Ref ref) async {
  final url = "/app-settings";
  final method = ref.watch(methodProvider);
  final result = await Networking.post(url, {});

  return switch (result) {
    Success(value: final value) => value.data["data"]
        ["rfp_cancellation_reasons"][method],
    Failure() => [],
    Error() => []
  };
}

@riverpod
Future<bool> cancelRFP(Ref ref,
    {required int rfpID,
    required List<String> reasons,
    required String description}) async {
  final url = "/cancel-rfp";
  final result = await Networking.post(url, {
    "rfp_id": rfpID,
    "reasons": reasons,
    "description": description,
  });

  return switch (result) {
    Success() => true,
    Failure() => false,
    Error() => false
  };
}

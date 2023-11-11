import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/utils/dio_helper.dart';

import '../../nearby_stores/domain/stores_repository.dart';
import '../data/buffer_data.dart';

part 'buffer_brand_domain.g.dart';

@riverpod
Future<List<CancelReason>> getCancelReasons(Ref ref) async {
  final url = "user/app-settings";
  final method = ref.watch(methodProvider);

  try {
    final request = await ref.watch(dioProvider).post(url, {});
    final data = request.data["data"]["rfp_cancellation_reasons"][method];
    return data
        .map<CancelReason>((e) => CancelReason.fromJson(e))
        .toList(growable: false);
  } catch (e) {}
  return [];
}

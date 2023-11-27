import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

import '../data/menu_data.dart';

part 'menu_domain.g.dart';

@riverpod
Future<List<MapCategories>> getMenuCategories(Ref ref,
    {required int id}) async {
  final url = "user/store-categories";
  final result = await Networking.post(url, {"store_id": id});

  return switch (result) {
    Success(value: final value) => () {
        final data = value.data["data"];
        return data.map((e) => MapCategories.fromJson(e)).toList();
      }(),
    Failure() => [],
    Error() => []
  };
}

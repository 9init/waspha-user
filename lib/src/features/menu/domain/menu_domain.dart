import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/utils/dio_helper.dart';

import '../data/menu_data.dart';

part 'menu_domain.g.dart';

@riverpod
Future<dynamic> getMenuCategories(Ref ref, {required int id}) async {
  final url = "user/store-categories";

  try {
    var request = await ref.watch(dioProvider).post(url, {
      "store_id": id,
    });
    var response = request.data;
    var data = response["data"];
    return data.map((e) => MapCategories.fromJson(e)).toList();
  } catch (e) {
    print("Menu Domain Error : ${e}");
  }
  return [];
}

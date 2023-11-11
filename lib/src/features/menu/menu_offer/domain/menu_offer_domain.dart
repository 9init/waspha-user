import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/dio_helper.dart';

part 'menu_offer_domain.g.dart';

final getStoresCategoriesProvider = FutureProvider.family((ref, id) async {
  const url = 'user/store-categories';

  try {
    final request = await ref.watch(dioProvider).post(url, {'store_id': id});
    final response = request.data["data"];
    return response;
  } on DioError catch (e) {
    print("CAT: ${e.response?.data}");
  }
});

@riverpod
Future<dynamic> getStoresProducts(Ref ref, {required int categoryID}) async {
  const url = 'user/store-products';
  try {
    final request =
        await ref.watch(dioProvider).post(url, {'category_id': categoryID});
    final response = request.data["data"];

    return response;
  } on DioError catch (e) {
    print("CAT: ${e.response?.data}");
  }
}

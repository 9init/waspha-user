import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

part 'menu_offer_domain.g.dart';

final getStoresCategoriesProvider = FutureProvider.family((ref, id) async {
  const url = '/store-categories';
  final result = await Networking.post(url, {'store_id': id});

  return switch (result) {
    Success(value: final value) => value.data["data"],
    Failure() => [],
    Error() => [],
  };
});

Future<dynamic> getStoresProducts(Ref ref, {required int categoryID}) async {
  const url = '/store-products';
  final result = await Networking.post(url, {'category_id': categoryID});

  switch (result) {
    case Success(value: final value):
      final response = value.data["data"];
      return response;
    case Failure():
    case Error():
      debugPrint("Error fetching store products");
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stores_data.freezed.dart';
part 'stores_data.g.dart';

@freezed
class Stores with _$Stores {
  const factory Stores({
    required int id,
    required Map<String,String> business_name,
    required String ar,
    required double lat,
    required double lng,
    required dynamic timings,
    required String image,
    required bool delivery,
    required bool pickup,
    required int vendor_id,
    required int category_id,
    required List<int> category_ids,
    required double distance,
    required double average_rating,
    required bool has_menu

  }) = _Stores;

  factory Stores.fromJson(dynamic json) => _$StoresFromJson(json);
}


@freezed
class Categories with _$Categories {
  const factory Categories({
    required int id,
    required Map<String,String> name,
    required String slug,
    String? image, secondary_image,
    required List<SubCategories> sub_categories,

  }) = _Categories;

  factory Categories.fromJson(dynamic json) => _$CategoriesFromJson(json);
}


@freezed
class SubCategories with _$SubCategories {
  const factory SubCategories({
    required int id,
    required Map<String,String> name,
    required String slug,
    String? image, secondary_image,
  }) = _StoresData;

  factory SubCategories.fromJson(dynamic json) => _$SubCategoriesFromJson(json);
}
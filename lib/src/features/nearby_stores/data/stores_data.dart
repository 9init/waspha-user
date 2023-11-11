import 'package:freezed_annotation/freezed_annotation.dart';

part 'stores_data.freezed.dart';
part 'stores_data.g.dart';

@unfreezed
class Stores with _$Stores {
  factory Stores(
      {required int id,
      Map<String, String>? business_name,
      String? ar,
      double? lat,
      double? lng,
      dynamic timings,
      String? image,
      bool? delivery,
      bool? pickup,
      int? vendor_id,
      bool? is_favorite,
      int? category_id,
      List<int>? category_ids,
      double? distance,
      double? average_rating,
      bool? has_menu}) = _Stores;

  factory Stores.fromJson(dynamic json) => _$StoresFromJson(json);
}

@freezed
class Categories with _$Categories {
  const factory Categories({
    required int id,
    Map<String, String>? name,
    String? slug,
    String? image,
    secondary_image,
    List<SubCategories>? sub_categories,
  }) = _Categories;

  factory Categories.fromJson(dynamic json) => _$CategoriesFromJson(json);
}

@freezed
class SubCategories with _$SubCategories {
  const factory SubCategories({
    required int id,
    required Map<String, String> name,
    required String slug,
    String? image,
    secondary_image,
  }) = _StoresData;

  factory SubCategories.fromJson(dynamic json) => _$SubCategoriesFromJson(json);
}

@freezed
class StoreCategory with _$StoreCategory {
  const factory StoreCategory({
    required int id,
    dynamic name,
    required bool is_enabled,
    String? slug,
    dynamic image,
    dynamic description,
    dynamic parent_id,
  }) = _StoreCategory;

  factory StoreCategory.fromJson(dynamic json) => _$StoreCategoryFromJson(json);
}

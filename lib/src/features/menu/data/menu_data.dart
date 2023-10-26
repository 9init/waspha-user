import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_data.freezed.dart';
part 'menu_data.g.dart';

@freezed
class MapCategories with _$MapCategories {
  const factory MapCategories({
    required int id,
    dynamic name,
    required bool is_enabled,
    dynamic slug,
    dynamic image,
    dynamic description,
    dynamic parent_id,

  }) = _MapCategories;

  factory MapCategories.fromJson(dynamic json) => _$MapCategoriesFromJson(json);
}

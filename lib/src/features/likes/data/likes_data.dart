import 'package:freezed_annotation/freezed_annotation.dart';


part 'likes_data.freezed.dart';
part 'likes_data.g.dart';

@unfreezed
class DataLocation with _$DataLocation {
  factory DataLocation({
    required int id,
    int? user_id,
    String? location_string,
    Location? location,
    String? landmark,
    String? location_type,
    int? is_custom_phone,
    Phone? phone,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
  }) = _DataLocation;
  factory DataLocation.fromJson(Map<String, dynamic> json) =>
      _$DataLocationFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    double? x,
    double? y,
  }) = _Location;
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Phone with _$Phone {
  const factory Phone({
    int? number,
    int? phonecode,
    String? full_number,
  }) = _Phone;
  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);
}

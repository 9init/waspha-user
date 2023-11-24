import 'package:freezed_annotation/freezed_annotation.dart';

part 'likes_data.freezed.dart';
part 'likes_data.g.dart';

@freezed
class DataLocation with _$DataLocation {
  factory DataLocation({
    required int id,
    required String title,
    required Location location,
    required String location_string,
    int? user_id,
    String? landmark,
    String? location_type,
    @Default(0) int is_custom_phone, // Updated type to bool
    Phone? phone,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
  }) = _DataLocation;
  factory DataLocation.fromJson(Map<String, dynamic> json) =>
      _$DataLocationFromJson(json);

  DataLocation._();
  bool get isCustomPhone => this.is_custom_phone == 1;
}

@freezed
class Location with _$Location {
  const factory Location({
    required double x,
    required double y,
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

import 'package:freezed_annotation/freezed_annotation.dart';

part 'likes_data.freezed.dart';
part 'likes_data.g.dart';


@freezed
class Location with _$Location {
  const factory Location({
    required int id,
    required String title,
    required String phone,
    required String landmark,
    required String address,
    required double lat,
    required double lng,
  }) = _Location;
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

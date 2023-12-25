import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_favorite_stores_request_model.freezed.dart';
part 'get_favorite_stores_request_model.g.dart';

@Freezed()
class GetFavoriteStoresRequestModel with _$GetFavoriteStoresRequestModel {
  const factory GetFavoriteStoresRequestModel({
    required Location location,
    required num range,
    required String method,
  }) = _GetFavoriteStoresRequestModel;

  factory GetFavoriteStoresRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetFavoriteStoresRequestModelFromJson(json);
}

@Freezed()
class Location with _$Location {
  const factory Location({
    required double lat,
    required double lng,
    required String country_code,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

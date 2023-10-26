import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    bool? is_device_active,
    String? name,
    String? email,
    String? country_code,
    String? contact,
    String? gender,
    DateTime? dob,
    String? avatar,
    String? language,
    int? loyalty_points,
    String? rc_id,
    String? rc_username,
    dynamic rc_email,
    String? referral_code,
    dynamic referred_by,
    bool? is_email_verified,
    bool? is_contact_verified,
    dynamic deletedAt,
    bool? is_fraud,
    Rating? rating,
    Country? country,
    double? latest_lat,
    double? latest_lng,
  }) = _UserData;
  factory UserData.fromJson(dynamic json) => _$UserDataFromJson(json);
}

@freezed
class Rating with _$Rating {
    const factory Rating({
        double? rating,
        int? count,
    }) = _Rating;
    factory Rating.fromJson(dynamic json) => _$RatingFromJson(json);
}

@freezed
class Country with _$Country {
    const factory Country({
        required DateTime createdAt,
        required DateTime updatedAt,
        required int id,
        required String iso,
        required String name,
        required String nicename,
        required String iso3,
        required int numcode,
        required int phonecode,
    }) = _Country;

    factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
}
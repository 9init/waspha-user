import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    required int id,
    String? createdAt,
    String? updatedAt,
    @Default(false) bool is_device_active,
    required String name,
    required String email,
    String? country_code,
    String? contact,
    String? gender,
    String? dob,
    int? otp,
    String? avatar,
    String? language,
    int? loyalty_points,
    required String device_token,
    String? rc_id,
    String? rc_username,
    String? rc_email,
    String? referral_code,
    String? referred_by,
    @Default(false) bool is_email_verified,
    @Default(false) bool is_contact_verified,
    String? unverified_email,
    String? unverified_country_code,
    String? unverified_contact,
    String? verify_email_otp,
    String? verify_contact_otp,
    String? deletedAt,
    @Default(false) bool is_fraud,
    double? latest_lat,
    double? latest_lng,
    String? currency_code,
    @Default(false) bool is_approved,
    required String refresh_token,
    required String access_token,
    String? country,
    required String rc_auth_token,
    double? avg_rating,
    dynamic verified,
    dynamic unverified

    
  }) = _LoginData;

  factory LoginData.fromJson(dynamic json) => _$LoginDataFromJson(json);
}



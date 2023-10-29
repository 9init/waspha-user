// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginDataImpl _$$LoginDataImplFromJson(Map<String, dynamic> json) =>
    _$LoginDataImpl(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      is_device_active: json['is_device_active'] as bool? ?? false,
      name: json['name'] as String,
      email: json['email'] as String,
      country_code: json['country_code'] as String?,
      contact: json['contact'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      otp: json['otp'] as int?,
      avatar: json['avatar'] as String?,
      language: json['language'] as String?,
      loyalty_points: json['loyalty_points'] as int?,
      device_token: json['device_token'] as String,
      rc_id: json['rc_id'] as String?,
      rc_username: json['rc_username'] as String?,
      rc_email: json['rc_email'] as String?,
      referral_code: json['referral_code'] as String?,
      referred_by: json['referred_by'] as String?,
      is_email_verified: json['is_email_verified'] as bool? ?? false,
      is_contact_verified: json['is_contact_verified'] as bool? ?? false,
      unverified_email: json['unverified_email'] as String?,
      unverified_country_code: json['unverified_country_code'] as String?,
      unverified_contact: json['unverified_contact'] as String?,
      verify_email_otp: json['verify_email_otp'] as String?,
      verify_contact_otp: json['verify_contact_otp'] as String?,
      deletedAt: json['deletedAt'] as String?,
      is_fraud: json['is_fraud'] as bool? ?? false,
      latest_lat: (json['latest_lat'] as num?)?.toDouble(),
      latest_lng: (json['latest_lng'] as num?)?.toDouble(),
      currency_code: json['currency_code'] as String?,
      is_approved: json['is_approved'] as bool? ?? false,
      refresh_token: json['refresh_token'] as String,
      access_token: json['access_token'] as String,
      country: json['country'] as String?,
      rc_auth_token: json['rc_auth_token'] as String,
      avg_rating: (json['avg_rating'] as num?)?.toDouble(),
      verified: json['verified'],
      unverified: json['unverified'],
    );

Map<String, dynamic> _$$LoginDataImplToJson(_$LoginDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'is_device_active': instance.is_device_active,
      'name': instance.name,
      'email': instance.email,
      'country_code': instance.country_code,
      'contact': instance.contact,
      'gender': instance.gender,
      'dob': instance.dob,
      'otp': instance.otp,
      'avatar': instance.avatar,
      'language': instance.language,
      'loyalty_points': instance.loyalty_points,
      'device_token': instance.device_token,
      'rc_id': instance.rc_id,
      'rc_username': instance.rc_username,
      'rc_email': instance.rc_email,
      'referral_code': instance.referral_code,
      'referred_by': instance.referred_by,
      'is_email_verified': instance.is_email_verified,
      'is_contact_verified': instance.is_contact_verified,
      'unverified_email': instance.unverified_email,
      'unverified_country_code': instance.unverified_country_code,
      'unverified_contact': instance.unverified_contact,
      'verify_email_otp': instance.verify_email_otp,
      'verify_contact_otp': instance.verify_contact_otp,
      'deletedAt': instance.deletedAt,
      'is_fraud': instance.is_fraud,
      'latest_lat': instance.latest_lat,
      'latest_lng': instance.latest_lng,
      'currency_code': instance.currency_code,
      'is_approved': instance.is_approved,
      'refresh_token': instance.refresh_token,
      'access_token': instance.access_token,
      'country': instance.country,
      'rc_auth_token': instance.rc_auth_token,
      'avg_rating': instance.avg_rating,
      'verified': instance.verified,
      'unverified': instance.unverified,
    };

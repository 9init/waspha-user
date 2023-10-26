// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      is_device_active: json['is_device_active'] as bool?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      country_code: json['country_code'] as String?,
      contact: json['contact'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      avatar: json['avatar'] as String?,
      language: json['language'] as String?,
      loyalty_points: json['loyalty_points'] as int?,
      rc_id: json['rc_id'] as String?,
      rc_username: json['rc_username'] as String?,
      rc_email: json['rc_email'],
      referral_code: json['referral_code'] as String?,
      referred_by: json['referred_by'],
      is_email_verified: json['is_email_verified'] as bool?,
      is_contact_verified: json['is_contact_verified'] as bool?,
      deletedAt: json['deletedAt'],
      is_fraud: json['is_fraud'] as bool?,
      rating: json['rating'] == null ? null : Rating.fromJson(json['rating']),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      latest_lat: (json['latest_lat'] as num?)?.toDouble(),
      latest_lng: (json['latest_lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'is_device_active': instance.is_device_active,
      'name': instance.name,
      'email': instance.email,
      'country_code': instance.country_code,
      'contact': instance.contact,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'avatar': instance.avatar,
      'language': instance.language,
      'loyalty_points': instance.loyalty_points,
      'rc_id': instance.rc_id,
      'rc_username': instance.rc_username,
      'rc_email': instance.rc_email,
      'referral_code': instance.referral_code,
      'referred_by': instance.referred_by,
      'is_email_verified': instance.is_email_verified,
      'is_contact_verified': instance.is_contact_verified,
      'deletedAt': instance.deletedAt,
      'is_fraud': instance.is_fraud,
      'rating': instance.rating,
      'country': instance.country,
      'latest_lat': instance.latest_lat,
      'latest_lng': instance.latest_lng,
    };

_$_Rating _$$_RatingFromJson(Map<String, dynamic> json) => _$_Rating(
      rating: (json['rating'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_RatingToJson(_$_Rating instance) => <String, dynamic>{
      'rating': instance.rating,
      'count': instance.count,
    };

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int,
      iso: json['iso'] as String,
      name: json['name'] as String,
      nicename: json['nicename'] as String,
      iso3: json['iso3'] as String,
      numcode: json['numcode'] as int,
      phonecode: json['phonecode'] as int,
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'id': instance.id,
      'iso': instance.iso,
      'name': instance.name,
      'nicename': instance.nicename,
      'iso3': instance.iso3,
      'numcode': instance.numcode,
      'phonecode': instance.phonecode,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataLocationImpl _$$DataLocationImplFromJson(Map<String, dynamic> json) =>
    _$DataLocationImpl(
      id: json['id'] as int,
      user_id: json['user_id'] as int?,
      location_string: json['location_string'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      landmark: json['landmark'] as String?,
      location_type: json['location_type'] as String?,
      is_custom_phone: json['is_custom_phone'] as int?,
      phone: json['phone'] == null
          ? null
          : Phone.fromJson(json['phone'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
    );

Map<String, dynamic> _$$DataLocationImplToJson(_$DataLocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'location_string': instance.location_string,
      'location': instance.location,
      'landmark': instance.landmark,
      'location_type': instance.location_type,
      'is_custom_phone': instance.is_custom_phone,
      'phone': instance.phone,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };

_$PhoneImpl _$$PhoneImplFromJson(Map<String, dynamic> json) => _$PhoneImpl(
      number: json['number'] as int?,
      phonecode: json['phonecode'] as int?,
      full_number: json['full_number'] as String?,
    );

Map<String, dynamic> _$$PhoneImplToJson(_$PhoneImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'phonecode': instance.phonecode,
      'full_number': instance.full_number,
    };

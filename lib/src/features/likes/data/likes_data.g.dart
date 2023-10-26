// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      id: json['id'] as int,
      title: json['title'] as String,
      phone: json['phone'] as String,
      landmark: json['landmark'] as String,
      address: json['address'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'phone': instance.phone,
      'landmark': instance.landmark,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
    };

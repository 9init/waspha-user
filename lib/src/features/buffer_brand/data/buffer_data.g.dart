// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buffer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CancelReasonImpl _$$CancelReasonImplFromJson(Map<String, dynamic> json) =>
    _$CancelReasonImpl(
      id: json['id'] as int,
      value: Value.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CancelReasonImplToJson(_$CancelReasonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

_$ValueImpl _$$ValueImplFromJson(Map<String, dynamic> json) => _$ValueImpl(
      en: json['en'] as String,
      ar: json['ar'] as String,
    );

Map<String, dynamic> _$$ValueImplToJson(_$ValueImpl instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rfp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RfpModelImpl _$$RfpModelImplFromJson(Map<String, dynamic> json) =>
    _$RfpModelImpl(
      id: json['id'] as int,
      order_date: DateTime.parse(json['order_date'] as String),
      expiry_time: DateTime.parse(json['expiry_time'] as String),
      type: json['type'] as String,
      total_proposals: json['total_proposals'] as int,
      rfp_status: json['rfp_status'] as String,
      status: json['status'] as String,
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      stores: (json['stores'] as List<dynamic>)
          .map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RfpModelImplToJson(_$RfpModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_date': instance.order_date.toIso8601String(),
      'expiry_time': instance.expiry_time.toIso8601String(),
      'type': instance.type,
      'total_proposals': instance.total_proposals,
      'rfp_status': instance.rfp_status,
      'status': instance.status,
      'category': instance.category,
      'stores': instance.stores,
    };

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: json['id'] as int,
      name: Map<String, String>.from(json['name'] as Map),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

_$StoreModelImpl _$$StoreModelImplFromJson(Map<String, dynamic> json) =>
    _$StoreModelImpl(
      name: json['name'] as String,
      id: json['id'] as int,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$StoreModelImplToJson(_$StoreModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'image': instance.image,
    };

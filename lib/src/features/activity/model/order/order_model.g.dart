// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      user_id: json['user_id'] as int,
      user_name: json['user_name'] as String,
      order_date: DateTime.parse(json['order_date'] as String),
      rfp_store_id: json['rfp_store_id'] as int,
      status_id: json['status_id'] as int,
      rfp_id: json['rfp_id'] as int,
      rfp_created_at: DateTime.parse(json['rfp_created_at'] as String),
      status: json['status'] as String,
      proposal_id: json['proposal_id'] as int,
      type: json['type'] as String,
      proposal_date: DateTime.parse(json['proposal_date'] as String),
      is_delivery_mode_changed: json['is_delivery_mode_changed'] as int,
      delivery_mode_id: json['delivery_mode_id'] as int,
      delivery_fee: (json['delivery_fee'] as num).toDouble(),
      old_delivery_fee: (json['old_delivery_fee'] as num).toDouble(),
      payment_method: json['payment_method'] as String?,
      delivery_location: json['delivery_location'] as String?,
      user_avatar: json['user_avatar'] as String?,
      order_picked: json['order_picked'] == null
          ? null
          : DateTime.parse(json['order_picked'] as String),
      vehicle_image: json['vehicle_image'] as String?,
      vehicle_color_image: json['vehicle_color_image'] as String?,
      store_name: json['store_name'] as String?,
      store_image: json['store_image'] as String?,
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'order_date': instance.order_date.toIso8601String(),
      'rfp_store_id': instance.rfp_store_id,
      'status_id': instance.status_id,
      'rfp_id': instance.rfp_id,
      'rfp_created_at': instance.rfp_created_at.toIso8601String(),
      'status': instance.status,
      'proposal_id': instance.proposal_id,
      'type': instance.type,
      'proposal_date': instance.proposal_date.toIso8601String(),
      'is_delivery_mode_changed': instance.is_delivery_mode_changed,
      'delivery_mode_id': instance.delivery_mode_id,
      'delivery_fee': instance.delivery_fee,
      'old_delivery_fee': instance.old_delivery_fee,
      'payment_method': instance.payment_method,
      'delivery_location': instance.delivery_location,
      'user_avatar': instance.user_avatar,
      'order_picked': instance.order_picked?.toIso8601String(),
      'vehicle_image': instance.vehicle_image,
      'vehicle_color_image': instance.vehicle_color_image,
      'store_name': instance.store_name,
      'store_image': instance.store_image,
    };

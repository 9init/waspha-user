import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    required int user_id,
    required String user_name,
    required DateTime order_date,
    required int rfp_store_id,
    required int status_id,
    required int rfp_id,
    required DateTime rfp_created_at,
    required String status,
    required int proposal_id,
    required String type,
    required DateTime proposal_date,
    required int is_delivery_mode_changed,
    required int delivery_mode_id,
    required double delivery_fee,
    required double old_delivery_fee,
    String? payment_method,
    String? delivery_location,
    String? user_avatar,
    DateTime? order_picked,
    String? vehicle_image,
    String? vehicle_color_image,
    String? store_name,
    String? store_image,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  // Private constructor
  const OrderModel._();

  // Method to check if the order type is "pickup"
  bool get isPickup => type == 'pickup';

  // Method to check if the order type is "delivery"
  bool get isDelivery => type == 'delivery';
}

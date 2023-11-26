// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waspha/src/models/loading_state/loading_state.dart';

part 'password_change_model.freezed.dart';

@freezed
class PasswordChangeModel with _$PasswordChangeModel {
  const factory PasswordChangeModel({
    @Default(LoadingState.initial) LoadingState state,
    @JsonKey(name: 'message') String? message,
  }) = _PasswordChangeModel;

  factory PasswordChangeModel.fromJson(Map<String, dynamic> json) {
    final status = json['status'] as bool?;
    return PasswordChangeModel(
      state: status == true ? LoadingState.success : LoadingState.error,
      message: json['message'] as String?,
    );
  }
}

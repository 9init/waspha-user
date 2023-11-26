// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_change_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordChangeModel {
  LoadingState get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordChangeModelCopyWith<PasswordChangeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordChangeModelCopyWith<$Res> {
  factory $PasswordChangeModelCopyWith(
          PasswordChangeModel value, $Res Function(PasswordChangeModel) then) =
      _$PasswordChangeModelCopyWithImpl<$Res, PasswordChangeModel>;
  @useResult
  $Res call({LoadingState state, @JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$PasswordChangeModelCopyWithImpl<$Res, $Val extends PasswordChangeModel>
    implements $PasswordChangeModelCopyWith<$Res> {
  _$PasswordChangeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordChangeModelImplCopyWith<$Res>
    implements $PasswordChangeModelCopyWith<$Res> {
  factory _$$PasswordChangeModelImplCopyWith(_$PasswordChangeModelImpl value,
          $Res Function(_$PasswordChangeModelImpl) then) =
      __$$PasswordChangeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadingState state, @JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$$PasswordChangeModelImplCopyWithImpl<$Res>
    extends _$PasswordChangeModelCopyWithImpl<$Res, _$PasswordChangeModelImpl>
    implements _$$PasswordChangeModelImplCopyWith<$Res> {
  __$$PasswordChangeModelImplCopyWithImpl(_$PasswordChangeModelImpl _value,
      $Res Function(_$PasswordChangeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = freezed,
  }) {
    return _then(_$PasswordChangeModelImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PasswordChangeModelImpl implements _PasswordChangeModel {
  const _$PasswordChangeModelImpl(
      {this.state = LoadingState.initial,
      @JsonKey(name: 'message') this.message});

  @override
  @JsonKey()
  final LoadingState state;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'PasswordChangeModel(state: $state, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangeModelImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangeModelImplCopyWith<_$PasswordChangeModelImpl> get copyWith =>
      __$$PasswordChangeModelImplCopyWithImpl<_$PasswordChangeModelImpl>(
          this, _$identity);
}

abstract class _PasswordChangeModel implements PasswordChangeModel {
  const factory _PasswordChangeModel(
          {final LoadingState state,
          @JsonKey(name: 'message') final String? message}) =
      _$PasswordChangeModelImpl;

  @override
  LoadingState get state;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$PasswordChangeModelImplCopyWith<_$PasswordChangeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

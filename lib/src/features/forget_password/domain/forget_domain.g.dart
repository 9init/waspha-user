// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$forgetPasswordHash() => r'2b7ba882b79002ccfd3446877625d570b1f59114';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef ForgetPasswordRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [forgetPassword].
@ProviderFor(forgetPassword)
const forgetPasswordProvider = ForgetPasswordFamily();

/// See also [forgetPassword].
class ForgetPasswordFamily extends Family<AsyncValue<dynamic>> {
  /// See also [forgetPassword].
  const ForgetPasswordFamily();

  /// See also [forgetPassword].
  ForgetPasswordProvider call({
    required String user_id,
    required BuildContext context,
  }) {
    return ForgetPasswordProvider(
      user_id: user_id,
      context: context,
    );
  }

  @override
  ForgetPasswordProvider getProviderOverride(
    covariant ForgetPasswordProvider provider,
  ) {
    return call(
      user_id: provider.user_id,
      context: provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'forgetPasswordProvider';
}

/// See also [forgetPassword].
class ForgetPasswordProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [forgetPassword].
  ForgetPasswordProvider({
    required this.user_id,
    required this.context,
  }) : super.internal(
          (ref) => forgetPassword(
            ref,
            user_id: user_id,
            context: context,
          ),
          from: forgetPasswordProvider,
          name: r'forgetPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forgetPasswordHash,
          dependencies: ForgetPasswordFamily._dependencies,
          allTransitiveDependencies:
              ForgetPasswordFamily._allTransitiveDependencies,
        );

  final String user_id;
  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is ForgetPasswordProvider &&
        other.user_id == user_id &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user_id.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

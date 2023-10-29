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

/// See also [forgetPassword].
@ProviderFor(forgetPassword)
const forgetPasswordProvider = ForgetPasswordFamily();

/// See also [forgetPassword].
class ForgetPasswordFamily extends Family<AsyncValue> {
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
class ForgetPasswordProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [forgetPassword].
  ForgetPasswordProvider({
    required String user_id,
    required BuildContext context,
  }) : this._internal(
          (ref) => forgetPassword(
            ref as ForgetPasswordRef,
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
          user_id: user_id,
          context: context,
        );

  ForgetPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user_id,
    required this.context,
  }) : super.internal();

  final String user_id;
  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(ForgetPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForgetPasswordProvider._internal(
        (ref) => create(ref as ForgetPasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user_id: user_id,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _ForgetPasswordProviderElement(this);
  }

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

mixin ForgetPasswordRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `user_id` of this provider.
  String get user_id;

  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _ForgetPasswordProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with ForgetPasswordRef {
  _ForgetPasswordProviderElement(super.provider);

  @override
  String get user_id => (origin as ForgetPasswordProvider).user_id;
  @override
  BuildContext get context => (origin as ForgetPasswordProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

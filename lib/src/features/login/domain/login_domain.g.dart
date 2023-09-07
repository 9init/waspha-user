// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendLogHash() => r'25d48523b5b79c462ddee4d6d29ea5d347b445b1';

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

typedef SendLogRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [sendLog].
@ProviderFor(sendLog)
const sendLogProvider = SendLogFamily();

/// See also [sendLog].
class SendLogFamily extends Family<AsyncValue<dynamic>> {
  /// See also [sendLog].
  const SendLogFamily();

  /// See also [sendLog].
  SendLogProvider call({
    required String mobile,
    required String password,
    required BuildContext context,
    bool keepLogin = false,
  }) {
    return SendLogProvider(
      mobile: mobile,
      password: password,
      context: context,
      keepLogin: keepLogin,
    );
  }

  @override
  SendLogProvider getProviderOverride(
    covariant SendLogProvider provider,
  ) {
    return call(
      mobile: provider.mobile,
      password: provider.password,
      context: provider.context,
      keepLogin: provider.keepLogin,
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
  String? get name => r'sendLogProvider';
}

/// See also [sendLog].
class SendLogProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [sendLog].
  SendLogProvider({
    required this.mobile,
    required this.password,
    required this.context,
    this.keepLogin = false,
  }) : super.internal(
          (ref) => sendLog(
            ref,
            mobile: mobile,
            password: password,
            context: context,
            keepLogin: keepLogin,
          ),
          from: sendLogProvider,
          name: r'sendLogProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendLogHash,
          dependencies: SendLogFamily._dependencies,
          allTransitiveDependencies: SendLogFamily._allTransitiveDependencies,
        );

  final String mobile;
  final String password;
  final BuildContext context;
  final bool keepLogin;

  @override
  bool operator ==(Object other) {
    return other is SendLogProvider &&
        other.mobile == mobile &&
        other.password == password &&
        other.context == context &&
        other.keepLogin == keepLogin;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mobile.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, keepLogin.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

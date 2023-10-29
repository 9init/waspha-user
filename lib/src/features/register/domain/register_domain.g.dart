// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendRegisterHash() => r'0303cbd1ba59842d46052cc702c8ca186645c583';

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

/// See also [sendRegister].
@ProviderFor(sendRegister)
const sendRegisterProvider = SendRegisterFamily();

/// See also [sendRegister].
class SendRegisterFamily extends Family<AsyncValue> {
  /// See also [sendRegister].
  const SendRegisterFamily();

  /// See also [sendRegister].
  SendRegisterProvider call({
    required String userName,
    required String email,
    required String countryCode,
    required String phoneNumber,
    required String password,
    required String fullNumber,
    required BuildContext context,
  }) {
    return SendRegisterProvider(
      userName: userName,
      email: email,
      countryCode: countryCode,
      phoneNumber: phoneNumber,
      password: password,
      fullNumber: fullNumber,
      context: context,
    );
  }

  @override
  SendRegisterProvider getProviderOverride(
    covariant SendRegisterProvider provider,
  ) {
    return call(
      userName: provider.userName,
      email: provider.email,
      countryCode: provider.countryCode,
      phoneNumber: provider.phoneNumber,
      password: provider.password,
      fullNumber: provider.fullNumber,
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
  String? get name => r'sendRegisterProvider';
}

/// See also [sendRegister].
class SendRegisterProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [sendRegister].
  SendRegisterProvider({
    required String userName,
    required String email,
    required String countryCode,
    required String phoneNumber,
    required String password,
    required String fullNumber,
    required BuildContext context,
  }) : this._internal(
          (ref) => sendRegister(
            ref as SendRegisterRef,
            userName: userName,
            email: email,
            countryCode: countryCode,
            phoneNumber: phoneNumber,
            password: password,
            fullNumber: fullNumber,
            context: context,
          ),
          from: sendRegisterProvider,
          name: r'sendRegisterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendRegisterHash,
          dependencies: SendRegisterFamily._dependencies,
          allTransitiveDependencies:
              SendRegisterFamily._allTransitiveDependencies,
          userName: userName,
          email: email,
          countryCode: countryCode,
          phoneNumber: phoneNumber,
          password: password,
          fullNumber: fullNumber,
          context: context,
        );

  SendRegisterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userName,
    required this.email,
    required this.countryCode,
    required this.phoneNumber,
    required this.password,
    required this.fullNumber,
    required this.context,
  }) : super.internal();

  final String userName;
  final String email;
  final String countryCode;
  final String phoneNumber;
  final String password;
  final String fullNumber;
  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(SendRegisterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendRegisterProvider._internal(
        (ref) => create(ref as SendRegisterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userName: userName,
        email: email,
        countryCode: countryCode,
        phoneNumber: phoneNumber,
        password: password,
        fullNumber: fullNumber,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _SendRegisterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendRegisterProvider &&
        other.userName == userName &&
        other.email == email &&
        other.countryCode == countryCode &&
        other.phoneNumber == phoneNumber &&
        other.password == password &&
        other.fullNumber == fullNumber &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, countryCode.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, fullNumber.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendRegisterRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `userName` of this provider.
  String get userName;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `countryCode` of this provider.
  String get countryCode;

  /// The parameter `phoneNumber` of this provider.
  String get phoneNumber;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `fullNumber` of this provider.
  String get fullNumber;

  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _SendRegisterProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with SendRegisterRef {
  _SendRegisterProviderElement(super.provider);

  @override
  String get userName => (origin as SendRegisterProvider).userName;
  @override
  String get email => (origin as SendRegisterProvider).email;
  @override
  String get countryCode => (origin as SendRegisterProvider).countryCode;
  @override
  String get phoneNumber => (origin as SendRegisterProvider).phoneNumber;
  @override
  String get password => (origin as SendRegisterProvider).password;
  @override
  String get fullNumber => (origin as SendRegisterProvider).fullNumber;
  @override
  BuildContext get context => (origin as SendRegisterProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

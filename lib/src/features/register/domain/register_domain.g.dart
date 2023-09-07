// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendRegisterHash() => r'dbcadfd217d86f08209a26bd29193808d95e6315';

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

typedef SendRegisterRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [sendRegister].
@ProviderFor(sendRegister)
const sendRegisterProvider = SendRegisterFamily();

/// See also [sendRegister].
class SendRegisterFamily extends Family<AsyncValue<dynamic>> {
  /// See also [sendRegister].
  const SendRegisterFamily();

  /// See also [sendRegister].
  SendRegisterProvider call({
    required String name,
    required String email,
    required String countryCode,
    required String phoneNumber,
    required String password,
    required String fullNumber,
    required BuildContext context,
  }) {
    return SendRegisterProvider(
      name: name,
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
      name: provider.name,
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
class SendRegisterProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [sendRegister].
  SendRegisterProvider({
    required this.name,
    required this.email,
    required this.countryCode,
    required this.phoneNumber,
    required this.password,
    required this.fullNumber,
    required this.context,
  }) : super.internal(
          (ref) => sendRegister(
            ref,
            name: name,
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
        );

  final String name;
  final String email;
  final String countryCode;
  final String phoneNumber;
  final String password;
  final String fullNumber;
  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is SendRegisterProvider &&
        other.name == name &&
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
    hash = _SystemHash.combine(hash, name.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, countryCode.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, fullNumber.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

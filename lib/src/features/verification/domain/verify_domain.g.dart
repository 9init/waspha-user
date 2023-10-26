// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$verifyOTPHash() => r'8fe4fec9d2ba794c039c7556010f9571a0ae5171';

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

typedef VerifyOTPRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [verifyOTP].
@ProviderFor(verifyOTP)
const verifyOTPProvider = VerifyOTPFamily();

/// See also [verifyOTP].
class VerifyOTPFamily extends Family<AsyncValue<dynamic>> {
  /// See also [verifyOTP].
  const VerifyOTPFamily();

  /// See also [verifyOTP].
  VerifyOTPProvider call({
    required String otp,
    required BuildContext context,
  }) {
    return VerifyOTPProvider(
      otp: otp,
      context: context,
    );
  }

  @override
  VerifyOTPProvider getProviderOverride(
    covariant VerifyOTPProvider provider,
  ) {
    return call(
      otp: provider.otp,
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
  String? get name => r'verifyOTPProvider';
}

/// See also [verifyOTP].
class VerifyOTPProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [verifyOTP].
  VerifyOTPProvider({
    required this.otp,
    required this.context,
  }) : super.internal(
          (ref) => verifyOTP(
            ref,
            otp: otp,
            context: context,
          ),
          from: verifyOTPProvider,
          name: r'verifyOTPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyOTPHash,
          dependencies: VerifyOTPFamily._dependencies,
          allTransitiveDependencies: VerifyOTPFamily._allTransitiveDependencies,
        );

  final String otp;
  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is VerifyOTPProvider &&
        other.otp == otp &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

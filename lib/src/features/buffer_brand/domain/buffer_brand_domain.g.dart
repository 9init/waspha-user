// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buffer_brand_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCancelReasonsHash() => r'1a5d72ab48e15725772bb180c26baf1717a0ec91';

/// See also [getCancelReasons].
@ProviderFor(getCancelReasons)
final getCancelReasonsProvider =
    AutoDisposeFutureProvider<List<CancelReason>>.internal(
  getCancelReasons,
  name: r'getCancelReasonsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCancelReasonsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCancelReasonsRef = AutoDisposeFutureProviderRef<List<CancelReason>>;
String _$cancelRFPHash() => r'88be65205289870f5e9540dbea487f496715fbf9';

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

/// See also [cancelRFP].
@ProviderFor(cancelRFP)
const cancelRFPProvider = CancelRFPFamily();

/// See also [cancelRFP].
class CancelRFPFamily extends Family<AsyncValue<bool>> {
  /// See also [cancelRFP].
  const CancelRFPFamily();

  /// See also [cancelRFP].
  CancelRFPProvider call({
    required int rfpID,
    required List<String> reasons,
    required String description,
  }) {
    return CancelRFPProvider(
      rfpID: rfpID,
      reasons: reasons,
      description: description,
    );
  }

  @override
  CancelRFPProvider getProviderOverride(
    covariant CancelRFPProvider provider,
  ) {
    return call(
      rfpID: provider.rfpID,
      reasons: provider.reasons,
      description: provider.description,
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
  String? get name => r'cancelRFPProvider';
}

/// See also [cancelRFP].
class CancelRFPProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [cancelRFP].
  CancelRFPProvider({
    required int rfpID,
    required List<String> reasons,
    required String description,
  }) : this._internal(
          (ref) => cancelRFP(
            ref as CancelRFPRef,
            rfpID: rfpID,
            reasons: reasons,
            description: description,
          ),
          from: cancelRFPProvider,
          name: r'cancelRFPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cancelRFPHash,
          dependencies: CancelRFPFamily._dependencies,
          allTransitiveDependencies: CancelRFPFamily._allTransitiveDependencies,
          rfpID: rfpID,
          reasons: reasons,
          description: description,
        );

  CancelRFPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.rfpID,
    required this.reasons,
    required this.description,
  }) : super.internal();

  final int rfpID;
  final List<String> reasons;
  final String description;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CancelRFPRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CancelRFPProvider._internal(
        (ref) => create(ref as CancelRFPRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        rfpID: rfpID,
        reasons: reasons,
        description: description,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CancelRFPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CancelRFPProvider &&
        other.rfpID == rfpID &&
        other.reasons == reasons &&
        other.description == description;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, rfpID.hashCode);
    hash = _SystemHash.combine(hash, reasons.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CancelRFPRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `rfpID` of this provider.
  int get rfpID;

  /// The parameter `reasons` of this provider.
  List<String> get reasons;

  /// The parameter `description` of this provider.
  String get description;
}

class _CancelRFPProviderElement extends AutoDisposeFutureProviderElement<bool>
    with CancelRFPRef {
  _CancelRFPProviderElement(super.provider);

  @override
  int get rfpID => (origin as CancelRFPProvider).rfpID;
  @override
  List<String> get reasons => (origin as CancelRFPProvider).reasons;
  @override
  String get description => (origin as CancelRFPProvider).description;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

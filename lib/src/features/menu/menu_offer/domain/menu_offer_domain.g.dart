// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_offer_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getStoresProductsHash() => r'c00d2a6df078be4443f5eed89ab4b847440c51f0';

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

/// See also [getStoresProducts].
@ProviderFor(getStoresProducts)
const getStoresProductsProvider = GetStoresProductsFamily();

/// See also [getStoresProducts].
class GetStoresProductsFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getStoresProducts].
  const GetStoresProductsFamily();

  /// See also [getStoresProducts].
  GetStoresProductsProvider call({
    required int categoryID,
  }) {
    return GetStoresProductsProvider(
      categoryID: categoryID,
    );
  }

  @override
  GetStoresProductsProvider getProviderOverride(
    covariant GetStoresProductsProvider provider,
  ) {
    return call(
      categoryID: provider.categoryID,
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
  String? get name => r'getStoresProductsProvider';
}

/// See also [getStoresProducts].
class GetStoresProductsProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [getStoresProducts].
  GetStoresProductsProvider({
    required int categoryID,
  }) : this._internal(
          (ref) => getStoresProducts(
            ref as GetStoresProductsRef,
            categoryID: categoryID,
          ),
          from: getStoresProductsProvider,
          name: r'getStoresProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getStoresProductsHash,
          dependencies: GetStoresProductsFamily._dependencies,
          allTransitiveDependencies:
              GetStoresProductsFamily._allTransitiveDependencies,
          categoryID: categoryID,
        );

  GetStoresProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryID,
  }) : super.internal();

  final int categoryID;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(GetStoresProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetStoresProductsProvider._internal(
        (ref) => create(ref as GetStoresProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryID: categoryID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _GetStoresProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetStoresProductsProvider && other.categoryID == categoryID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetStoresProductsRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `categoryID` of this provider.
  int get categoryID;
}

class _GetStoresProductsProviderElement
    extends AutoDisposeFutureProviderElement<dynamic>
    with GetStoresProductsRef {
  _GetStoresProductsProviderElement(super.provider);

  @override
  int get categoryID => (origin as GetStoresProductsProvider).categoryID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

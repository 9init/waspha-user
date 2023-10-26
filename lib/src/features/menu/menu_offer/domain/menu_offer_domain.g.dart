// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_offer_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getStoresProductsHash() => r'c43bb58613e7600a04505b80f4215927fe0ab6d5';

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

typedef GetStoresProductsRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [getStoresProducts].
@ProviderFor(getStoresProducts)
const getStoresProductsProvider = GetStoresProductsFamily();

/// See also [getStoresProducts].
class GetStoresProductsFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getStoresProducts].
  const GetStoresProductsFamily();

  /// See also [getStoresProducts].
  GetStoresProductsProvider call({
    required int storeID,
    required int categoryID,
  }) {
    return GetStoresProductsProvider(
      storeID: storeID,
      categoryID: categoryID,
    );
  }

  @override
  GetStoresProductsProvider getProviderOverride(
    covariant GetStoresProductsProvider provider,
  ) {
    return call(
      storeID: provider.storeID,
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
    required this.storeID,
    required this.categoryID,
  }) : super.internal(
          (ref) => getStoresProducts(
            ref,
            storeID: storeID,
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
        );

  final int storeID;
  final int categoryID;

  @override
  bool operator ==(Object other) {
    return other is GetStoresProductsProvider &&
        other.storeID == storeID &&
        other.categoryID == categoryID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, storeID.hashCode);
    hash = _SystemHash.combine(hash, categoryID.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

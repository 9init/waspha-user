// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_detail.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getStoresDetailsHash() => r'c35b6f7a39aabe86bac118c696e6fb30278f855e';

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

/// See also [getStoresDetails].
@ProviderFor(getStoresDetails)
const getStoresDetailsProvider = GetStoresDetailsFamily();

/// See also [getStoresDetails].
class GetStoresDetailsFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getStoresDetails].
  const GetStoresDetailsFamily();

  /// See also [getStoresDetails].
  GetStoresDetailsProvider call({
    required int id,
  }) {
    return GetStoresDetailsProvider(
      id: id,
    );
  }

  @override
  GetStoresDetailsProvider getProviderOverride(
    covariant GetStoresDetailsProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'getStoresDetailsProvider';
}

/// See also [getStoresDetails].
class GetStoresDetailsProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [getStoresDetails].
  GetStoresDetailsProvider({
    required int id,
  }) : this._internal(
          (ref) => getStoresDetails(
            ref as GetStoresDetailsRef,
            id: id,
          ),
          from: getStoresDetailsProvider,
          name: r'getStoresDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getStoresDetailsHash,
          dependencies: GetStoresDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetStoresDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  GetStoresDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(GetStoresDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetStoresDetailsProvider._internal(
        (ref) => create(ref as GetStoresDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _GetStoresDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetStoresDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetStoresDetailsRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetStoresDetailsProviderElement
    extends AutoDisposeFutureProviderElement<dynamic> with GetStoresDetailsRef {
  _GetStoresDetailsProviderElement(super.provider);

  @override
  int get id => (origin as GetStoresDetailsProvider).id;
}

String _$getStoreReviewsHash() => r'14d2a7a36f06d0c1b303efe633cc31157fd2b488';

/// See also [getStoreReviews].
@ProviderFor(getStoreReviews)
const getStoreReviewsProvider = GetStoreReviewsFamily();

/// See also [getStoreReviews].
class GetStoreReviewsFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getStoreReviews].
  const GetStoreReviewsFamily();

  /// See also [getStoreReviews].
  GetStoreReviewsProvider call({
    required int id,
  }) {
    return GetStoreReviewsProvider(
      id: id,
    );
  }

  @override
  GetStoreReviewsProvider getProviderOverride(
    covariant GetStoreReviewsProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'getStoreReviewsProvider';
}

/// See also [getStoreReviews].
class GetStoreReviewsProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [getStoreReviews].
  GetStoreReviewsProvider({
    required int id,
  }) : this._internal(
          (ref) => getStoreReviews(
            ref as GetStoreReviewsRef,
            id: id,
          ),
          from: getStoreReviewsProvider,
          name: r'getStoreReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getStoreReviewsHash,
          dependencies: GetStoreReviewsFamily._dependencies,
          allTransitiveDependencies:
              GetStoreReviewsFamily._allTransitiveDependencies,
          id: id,
        );

  GetStoreReviewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(GetStoreReviewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetStoreReviewsProvider._internal(
        (ref) => create(ref as GetStoreReviewsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _GetStoreReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetStoreReviewsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetStoreReviewsRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetStoreReviewsProviderElement
    extends AutoDisposeFutureProviderElement<dynamic> with GetStoreReviewsRef {
  _GetStoreReviewsProviderElement(super.provider);

  @override
  int get id => (origin as GetStoreReviewsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

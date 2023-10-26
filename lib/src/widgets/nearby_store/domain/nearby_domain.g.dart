// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addStoreFavHash() => r'24db0c6a43218394933caacd01942a59d2883498';

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

typedef AddStoreFavRef = AutoDisposeFutureProviderRef<bool>;

/// See also [addStoreFav].
@ProviderFor(addStoreFav)
const addStoreFavProvider = AddStoreFavFamily();

/// See also [addStoreFav].
class AddStoreFavFamily extends Family<AsyncValue<bool>> {
  /// See also [addStoreFav].
  const AddStoreFavFamily();

  /// See also [addStoreFav].
  AddStoreFavProvider call({
    required int id,
  }) {
    return AddStoreFavProvider(
      id: id,
    );
  }

  @override
  AddStoreFavProvider getProviderOverride(
    covariant AddStoreFavProvider provider,
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
  String? get name => r'addStoreFavProvider';
}

/// See also [addStoreFav].
class AddStoreFavProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [addStoreFav].
  AddStoreFavProvider({
    required this.id,
  }) : super.internal(
          (ref) => addStoreFav(
            ref,
            id: id,
          ),
          from: addStoreFavProvider,
          name: r'addStoreFavProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addStoreFavHash,
          dependencies: AddStoreFavFamily._dependencies,
          allTransitiveDependencies:
              AddStoreFavFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is AddStoreFavProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$deleteStoreFavHash() => r'80519648901a4cb77221b564e8724f2576210477';
typedef DeleteStoreFavRef = AutoDisposeFutureProviderRef<bool>;

/// See also [deleteStoreFav].
@ProviderFor(deleteStoreFav)
const deleteStoreFavProvider = DeleteStoreFavFamily();

/// See also [deleteStoreFav].
class DeleteStoreFavFamily extends Family<AsyncValue<bool>> {
  /// See also [deleteStoreFav].
  const DeleteStoreFavFamily();

  /// See also [deleteStoreFav].
  DeleteStoreFavProvider call({
    required int id,
  }) {
    return DeleteStoreFavProvider(
      id: id,
    );
  }

  @override
  DeleteStoreFavProvider getProviderOverride(
    covariant DeleteStoreFavProvider provider,
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
  String? get name => r'deleteStoreFavProvider';
}

/// See also [deleteStoreFav].
class DeleteStoreFavProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteStoreFav].
  DeleteStoreFavProvider({
    required this.id,
  }) : super.internal(
          (ref) => deleteStoreFav(
            ref,
            id: id,
          ),
          from: deleteStoreFavProvider,
          name: r'deleteStoreFavProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteStoreFavHash,
          dependencies: DeleteStoreFavFamily._dependencies,
          allTransitiveDependencies:
              DeleteStoreFavFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is DeleteStoreFavProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getFavStoresHash() => r'c95c38a26ce4990919f4f6789a04cd17be5b7920';

/// See also [getFavStores].
@ProviderFor(getFavStores)
final getFavStoresProvider = AutoDisposeFutureProvider<dynamic>.internal(
  getFavStores,
  name: r'getFavStoresProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getFavStoresHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFavStoresRef = AutoDisposeFutureProviderRef<dynamic>;
String _$isStoreFavoritedHash() => r'2fff11762e619fac4e3ac0145a0ef42c475ce51d';
typedef IsStoreFavoritedRef = AutoDisposeFutureProviderRef<bool>;

/// See also [isStoreFavorited].
@ProviderFor(isStoreFavorited)
const isStoreFavoritedProvider = IsStoreFavoritedFamily();

/// See also [isStoreFavorited].
class IsStoreFavoritedFamily extends Family<AsyncValue<bool>> {
  /// See also [isStoreFavorited].
  const IsStoreFavoritedFamily();

  /// See also [isStoreFavorited].
  IsStoreFavoritedProvider call({
    required int id,
  }) {
    return IsStoreFavoritedProvider(
      id: id,
    );
  }

  @override
  IsStoreFavoritedProvider getProviderOverride(
    covariant IsStoreFavoritedProvider provider,
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
  String? get name => r'isStoreFavoritedProvider';
}

/// See also [isStoreFavorited].
class IsStoreFavoritedProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [isStoreFavorited].
  IsStoreFavoritedProvider({
    required this.id,
  }) : super.internal(
          (ref) => isStoreFavorited(
            ref,
            id: id,
          ),
          from: isStoreFavoritedProvider,
          name: r'isStoreFavoritedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isStoreFavoritedHash,
          dependencies: IsStoreFavoritedFamily._dependencies,
          allTransitiveDependencies:
              IsStoreFavoritedFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is IsStoreFavoritedProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

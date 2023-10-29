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
    required int id,
  }) : this._internal(
          (ref) => addStoreFav(
            ref as AddStoreFavRef,
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
          id: id,
        );

  AddStoreFavProvider._internal(
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
    FutureOr<bool> Function(AddStoreFavRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddStoreFavProvider._internal(
        (ref) => create(ref as AddStoreFavRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _AddStoreFavProviderElement(this);
  }

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

mixin AddStoreFavRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `id` of this provider.
  int get id;
}

class _AddStoreFavProviderElement extends AutoDisposeFutureProviderElement<bool>
    with AddStoreFavRef {
  _AddStoreFavProviderElement(super.provider);

  @override
  int get id => (origin as AddStoreFavProvider).id;
}

String _$deleteStoreFavHash() => r'80519648901a4cb77221b564e8724f2576210477';

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
    required int id,
  }) : this._internal(
          (ref) => deleteStoreFav(
            ref as DeleteStoreFavRef,
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
          id: id,
        );

  DeleteStoreFavProvider._internal(
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
    FutureOr<bool> Function(DeleteStoreFavRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteStoreFavProvider._internal(
        (ref) => create(ref as DeleteStoreFavRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DeleteStoreFavProviderElement(this);
  }

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

mixin DeleteStoreFavRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteStoreFavProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DeleteStoreFavRef {
  _DeleteStoreFavProviderElement(super.provider);

  @override
  int get id => (origin as DeleteStoreFavProvider).id;
}

String _$getFavStoresHash() => r'ea74f9ce62f9e70088f8318f2c640e070879a69d';

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
    required int id,
  }) : this._internal(
          (ref) => isStoreFavorited(
            ref as IsStoreFavoritedRef,
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
          id: id,
        );

  IsStoreFavoritedProvider._internal(
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
    FutureOr<bool> Function(IsStoreFavoritedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsStoreFavoritedProvider._internal(
        (ref) => create(ref as IsStoreFavoritedRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _IsStoreFavoritedProviderElement(this);
  }

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

mixin IsStoreFavoritedRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `id` of this provider.
  int get id;
}

class _IsStoreFavoritedProviderElement
    extends AutoDisposeFutureProviderElement<bool> with IsStoreFavoritedRef {
  _IsStoreFavoritedProviderElement(super.provider);

  @override
  int get id => (origin as IsStoreFavoritedProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

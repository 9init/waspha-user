// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMenuCategoriesHash() => r'af84ca8e699b7699ffa7a2b2725841a2b9c63a08';

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

typedef GetMenuCategoriesRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [getMenuCategories].
@ProviderFor(getMenuCategories)
const getMenuCategoriesProvider = GetMenuCategoriesFamily();

/// See also [getMenuCategories].
class GetMenuCategoriesFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getMenuCategories].
  const GetMenuCategoriesFamily();

  /// See also [getMenuCategories].
  GetMenuCategoriesProvider call({
    required int id,
  }) {
    return GetMenuCategoriesProvider(
      id: id,
    );
  }

  @override
  GetMenuCategoriesProvider getProviderOverride(
    covariant GetMenuCategoriesProvider provider,
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
  String? get name => r'getMenuCategoriesProvider';
}

/// See also [getMenuCategories].
class GetMenuCategoriesProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [getMenuCategories].
  GetMenuCategoriesProvider({
    required this.id,
  }) : super.internal(
          (ref) => getMenuCategories(
            ref,
            id: id,
          ),
          from: getMenuCategoriesProvider,
          name: r'getMenuCategoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMenuCategoriesHash,
          dependencies: GetMenuCategoriesFamily._dependencies,
          allTransitiveDependencies:
              GetMenuCategoriesFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is GetMenuCategoriesProvider && other.id == id;
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

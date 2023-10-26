// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNearbyStoresStreamHash() =>
    r'b487d72936aa667e58a4b8b1282cad4769cbb319';

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

typedef GetNearbyStoresStreamRef = StreamProviderRef<dynamic>;

/// See also [getNearbyStoresStream].
@ProviderFor(getNearbyStoresStream)
const getNearbyStoresStreamProvider = GetNearbyStoresStreamFamily();

/// See also [getNearbyStoresStream].
class GetNearbyStoresStreamFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getNearbyStoresStream].
  const GetNearbyStoresStreamFamily();

  /// See also [getNearbyStoresStream].
  GetNearbyStoresStreamProvider call({
    required BuildContext context,
    required ValueNotifier<bool> isBottomSheetOpen,
    required ValueNotifier<LatLng> userLocation,
  }) {
    return GetNearbyStoresStreamProvider(
      context: context,
      isBottomSheetOpen: isBottomSheetOpen,
      userLocation: userLocation,
    );
  }

  @override
  GetNearbyStoresStreamProvider getProviderOverride(
    covariant GetNearbyStoresStreamProvider provider,
  ) {
    return call(
      context: provider.context,
      isBottomSheetOpen: provider.isBottomSheetOpen,
      userLocation: provider.userLocation,
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
  String? get name => r'getNearbyStoresStreamProvider';
}

/// See also [getNearbyStoresStream].
class GetNearbyStoresStreamProvider extends StreamProvider<dynamic> {
  /// See also [getNearbyStoresStream].
  GetNearbyStoresStreamProvider({
    required this.context,
    required this.isBottomSheetOpen,
    required this.userLocation,
  }) : super.internal(
          (ref) => getNearbyStoresStream(
            ref,
            context: context,
            isBottomSheetOpen: isBottomSheetOpen,
            userLocation: userLocation,
          ),
          from: getNearbyStoresStreamProvider,
          name: r'getNearbyStoresStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNearbyStoresStreamHash,
          dependencies: GetNearbyStoresStreamFamily._dependencies,
          allTransitiveDependencies:
              GetNearbyStoresStreamFamily._allTransitiveDependencies,
        );

  final BuildContext context;
  final ValueNotifier<bool> isBottomSheetOpen;
  final ValueNotifier<LatLng> userLocation;

  @override
  bool operator ==(Object other) {
    return other is GetNearbyStoresStreamProvider &&
        other.context == context &&
        other.isBottomSheetOpen == isBottomSheetOpen &&
        other.userLocation == userLocation;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, isBottomSheetOpen.hashCode);
    hash = _SystemHash.combine(hash, userLocation.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getNearbyStoresHash() => r'330c313ba6894c79502ff2e5e6a8bcf8eb2834b7';
typedef GetNearbyStoresRef = FutureProviderRef<dynamic>;

/// See also [getNearbyStores].
@ProviderFor(getNearbyStores)
const getNearbyStoresProvider = GetNearbyStoresFamily();

/// See also [getNearbyStores].
class GetNearbyStoresFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getNearbyStores].
  const GetNearbyStoresFamily();

  /// See also [getNearbyStores].
  GetNearbyStoresProvider call({
    required BuildContext context,
    required ValueNotifier<bool> isBottomSheetOpen,
    required ValueNotifier<LatLng> userLocation,
  }) {
    return GetNearbyStoresProvider(
      context: context,
      isBottomSheetOpen: isBottomSheetOpen,
      userLocation: userLocation,
    );
  }

  @override
  GetNearbyStoresProvider getProviderOverride(
    covariant GetNearbyStoresProvider provider,
  ) {
    return call(
      context: provider.context,
      isBottomSheetOpen: provider.isBottomSheetOpen,
      userLocation: provider.userLocation,
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
  String? get name => r'getNearbyStoresProvider';
}

/// See also [getNearbyStores].
class GetNearbyStoresProvider extends FutureProvider<dynamic> {
  /// See also [getNearbyStores].
  GetNearbyStoresProvider({
    required this.context,
    required this.isBottomSheetOpen,
    required this.userLocation,
  }) : super.internal(
          (ref) => getNearbyStores(
            ref,
            context: context,
            isBottomSheetOpen: isBottomSheetOpen,
            userLocation: userLocation,
          ),
          from: getNearbyStoresProvider,
          name: r'getNearbyStoresProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNearbyStoresHash,
          dependencies: GetNearbyStoresFamily._dependencies,
          allTransitiveDependencies:
              GetNearbyStoresFamily._allTransitiveDependencies,
        );

  final BuildContext context;
  final ValueNotifier<bool> isBottomSheetOpen;
  final ValueNotifier<LatLng> userLocation;

  @override
  bool operator ==(Object other) {
    return other is GetNearbyStoresProvider &&
        other.context == context &&
        other.isBottomSheetOpen == isBottomSheetOpen &&
        other.userLocation == userLocation;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, isBottomSheetOpen.hashCode);
    hash = _SystemHash.combine(hash, userLocation.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

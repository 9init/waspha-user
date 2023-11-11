// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNearbyStoresStreamHash() =>
    r'1932ca5b87b3f3ec1285f54fc5d1d1c2162c4516';

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
class GetNearbyStoresStreamProvider extends AutoDisposeStreamProvider<dynamic> {
  /// See also [getNearbyStoresStream].
  GetNearbyStoresStreamProvider({
    required BuildContext context,
    required ValueNotifier<bool> isBottomSheetOpen,
    required ValueNotifier<LatLng> userLocation,
  }) : this._internal(
          (ref) => getNearbyStoresStream(
            ref as GetNearbyStoresStreamRef,
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
          context: context,
          isBottomSheetOpen: isBottomSheetOpen,
          userLocation: userLocation,
        );

  GetNearbyStoresStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
    required this.isBottomSheetOpen,
    required this.userLocation,
  }) : super.internal();

  final BuildContext context;
  final ValueNotifier<bool> isBottomSheetOpen;
  final ValueNotifier<LatLng> userLocation;

  @override
  Override overrideWith(
    Stream<dynamic> Function(GetNearbyStoresStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNearbyStoresStreamProvider._internal(
        (ref) => create(ref as GetNearbyStoresStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
        isBottomSheetOpen: isBottomSheetOpen,
        userLocation: userLocation,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<dynamic> createElement() {
    return _GetNearbyStoresStreamProviderElement(this);
  }

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

mixin GetNearbyStoresStreamRef on AutoDisposeStreamProviderRef<dynamic> {
  /// The parameter `context` of this provider.
  BuildContext get context;

  /// The parameter `isBottomSheetOpen` of this provider.
  ValueNotifier<bool> get isBottomSheetOpen;

  /// The parameter `userLocation` of this provider.
  ValueNotifier<LatLng> get userLocation;
}

class _GetNearbyStoresStreamProviderElement
    extends AutoDisposeStreamProviderElement<dynamic>
    with GetNearbyStoresStreamRef {
  _GetNearbyStoresStreamProviderElement(super.provider);

  @override
  BuildContext get context => (origin as GetNearbyStoresStreamProvider).context;
  @override
  ValueNotifier<bool> get isBottomSheetOpen =>
      (origin as GetNearbyStoresStreamProvider).isBottomSheetOpen;
  @override
  ValueNotifier<LatLng> get userLocation =>
      (origin as GetNearbyStoresStreamProvider).userLocation;
}

String _$getNearbyStoresHash() => r'd18339fff7b982bec163da138b06511445f2fed7';

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
class GetNearbyStoresProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [getNearbyStores].
  GetNearbyStoresProvider({
    required BuildContext context,
    required ValueNotifier<bool> isBottomSheetOpen,
    required ValueNotifier<LatLng> userLocation,
  }) : this._internal(
          (ref) => getNearbyStores(
            ref as GetNearbyStoresRef,
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
          context: context,
          isBottomSheetOpen: isBottomSheetOpen,
          userLocation: userLocation,
        );

  GetNearbyStoresProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
    required this.isBottomSheetOpen,
    required this.userLocation,
  }) : super.internal();

  final BuildContext context;
  final ValueNotifier<bool> isBottomSheetOpen;
  final ValueNotifier<LatLng> userLocation;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(GetNearbyStoresRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNearbyStoresProvider._internal(
        (ref) => create(ref as GetNearbyStoresRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
        isBottomSheetOpen: isBottomSheetOpen,
        userLocation: userLocation,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _GetNearbyStoresProviderElement(this);
  }

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

mixin GetNearbyStoresRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `context` of this provider.
  BuildContext get context;

  /// The parameter `isBottomSheetOpen` of this provider.
  ValueNotifier<bool> get isBottomSheetOpen;

  /// The parameter `userLocation` of this provider.
  ValueNotifier<LatLng> get userLocation;
}

class _GetNearbyStoresProviderElement
    extends AutoDisposeFutureProviderElement<dynamic> with GetNearbyStoresRef {
  _GetNearbyStoresProviderElement(super.provider);

  @override
  BuildContext get context => (origin as GetNearbyStoresProvider).context;
  @override
  ValueNotifier<bool> get isBottomSheetOpen =>
      (origin as GetNearbyStoresProvider).isBottomSheetOpen;
  @override
  ValueNotifier<LatLng> get userLocation =>
      (origin as GetNearbyStoresProvider).userLocation;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

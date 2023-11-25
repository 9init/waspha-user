// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addLocationHash() => r'618f31b26d589ca408b5b1ba174c6e35ae027701';

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

/// See also [addLocation].
@ProviderFor(addLocation)
const addLocationProvider = AddLocationFamily();

/// See also [addLocation].
class AddLocationFamily extends Family<AsyncValue<String>> {
  /// See also [addLocation].
  const AddLocationFamily();

  /// See also [addLocation].
  AddLocationProvider call({
    required String title,
    required String? phone,
    required String? userName,
    required String landmark,
    required String locationType,
    bool isMeChecked = false,
  }) {
    return AddLocationProvider(
      title: title,
      phone: phone,
      userName: userName,
      landmark: landmark,
      locationType: locationType,
      isMeChecked: isMeChecked,
    );
  }

  @override
  AddLocationProvider getProviderOverride(
    covariant AddLocationProvider provider,
  ) {
    return call(
      title: provider.title,
      phone: provider.phone,
      userName: provider.userName,
      landmark: provider.landmark,
      locationType: provider.locationType,
      isMeChecked: provider.isMeChecked,
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
  String? get name => r'addLocationProvider';
}

/// See also [addLocation].
class AddLocationProvider extends AutoDisposeFutureProvider<String> {
  /// See also [addLocation].
  AddLocationProvider({
    required String title,
    required String? phone,
    required String? userName,
    required String landmark,
    required String locationType,
    bool isMeChecked = false,
  }) : this._internal(
          (ref) => addLocation(
            ref as AddLocationRef,
            title: title,
            phone: phone,
            userName: userName,
            landmark: landmark,
            locationType: locationType,
            isMeChecked: isMeChecked,
          ),
          from: addLocationProvider,
          name: r'addLocationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addLocationHash,
          dependencies: AddLocationFamily._dependencies,
          allTransitiveDependencies:
              AddLocationFamily._allTransitiveDependencies,
          title: title,
          phone: phone,
          userName: userName,
          landmark: landmark,
          locationType: locationType,
          isMeChecked: isMeChecked,
        );

  AddLocationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
    required this.phone,
    required this.userName,
    required this.landmark,
    required this.locationType,
    required this.isMeChecked,
  }) : super.internal();

  final String title;
  final String? phone;
  final String? userName;
  final String landmark;
  final String locationType;
  final bool isMeChecked;

  @override
  Override overrideWith(
    FutureOr<String> Function(AddLocationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddLocationProvider._internal(
        (ref) => create(ref as AddLocationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
        phone: phone,
        userName: userName,
        landmark: landmark,
        locationType: locationType,
        isMeChecked: isMeChecked,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _AddLocationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddLocationProvider &&
        other.title == title &&
        other.phone == phone &&
        other.userName == userName &&
        other.landmark == landmark &&
        other.locationType == locationType &&
        other.isMeChecked == isMeChecked;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, landmark.hashCode);
    hash = _SystemHash.combine(hash, locationType.hashCode);
    hash = _SystemHash.combine(hash, isMeChecked.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddLocationRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `phone` of this provider.
  String? get phone;

  /// The parameter `userName` of this provider.
  String? get userName;

  /// The parameter `landmark` of this provider.
  String get landmark;

  /// The parameter `locationType` of this provider.
  String get locationType;

  /// The parameter `isMeChecked` of this provider.
  bool get isMeChecked;
}

class _AddLocationProviderElement
    extends AutoDisposeFutureProviderElement<String> with AddLocationRef {
  _AddLocationProviderElement(super.provider);

  @override
  String get title => (origin as AddLocationProvider).title;
  @override
  String? get phone => (origin as AddLocationProvider).phone;
  @override
  String? get userName => (origin as AddLocationProvider).userName;
  @override
  String get landmark => (origin as AddLocationProvider).landmark;
  @override
  String get locationType => (origin as AddLocationProvider).locationType;
  @override
  bool get isMeChecked => (origin as AddLocationProvider).isMeChecked;
}

String _$getLocationsHash() => r'7f92a9e1c21c1ed317510e2cb37290b42bd9aa1c';

/// See also [getLocations].
@ProviderFor(getLocations)
final getLocationsProvider =
    AutoDisposeFutureProvider<List<DataLocation>>.internal(
  getLocations,
  name: r'getLocationsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getLocationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetLocationsRef = AutoDisposeFutureProviderRef<List<DataLocation>>;
String _$addLocationFavHash() => r'3625283b614fec1c039245645ba96547171aa050';

/// See also [addLocationFav].
@ProviderFor(addLocationFav)
const addLocationFavProvider = AddLocationFavFamily();

/// See also [addLocationFav].
class AddLocationFavFamily extends Family<AsyncValue<String>> {
  /// See also [addLocationFav].
  const AddLocationFavFamily();

  /// See also [addLocationFav].
  AddLocationFavProvider call({
    required LatLng location,
    required String address,
  }) {
    return AddLocationFavProvider(
      location: location,
      address: address,
    );
  }

  @override
  AddLocationFavProvider getProviderOverride(
    covariant AddLocationFavProvider provider,
  ) {
    return call(
      location: provider.location,
      address: provider.address,
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
  String? get name => r'addLocationFavProvider';
}

/// See also [addLocationFav].
class AddLocationFavProvider extends AutoDisposeFutureProvider<String> {
  /// See also [addLocationFav].
  AddLocationFavProvider({
    required LatLng location,
    required String address,
  }) : this._internal(
          (ref) => addLocationFav(
            ref as AddLocationFavRef,
            location: location,
            address: address,
          ),
          from: addLocationFavProvider,
          name: r'addLocationFavProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addLocationFavHash,
          dependencies: AddLocationFavFamily._dependencies,
          allTransitiveDependencies:
              AddLocationFavFamily._allTransitiveDependencies,
          location: location,
          address: address,
        );

  AddLocationFavProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.location,
    required this.address,
  }) : super.internal();

  final LatLng location;
  final String address;

  @override
  Override overrideWith(
    FutureOr<String> Function(AddLocationFavRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddLocationFavProvider._internal(
        (ref) => create(ref as AddLocationFavRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        location: location,
        address: address,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _AddLocationFavProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddLocationFavProvider &&
        other.location == location &&
        other.address == address;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddLocationFavRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `location` of this provider.
  LatLng get location;

  /// The parameter `address` of this provider.
  String get address;
}

class _AddLocationFavProviderElement
    extends AutoDisposeFutureProviderElement<String> with AddLocationFavRef {
  _AddLocationFavProviderElement(super.provider);

  @override
  LatLng get location => (origin as AddLocationFavProvider).location;
  @override
  String get address => (origin as AddLocationFavProvider).address;
}

String _$deleteLocationHash() => r'ec53de126b0f5c73d077b78a8a686fc3a61ced97';

/// See also [deleteLocation].
@ProviderFor(deleteLocation)
const deleteLocationProvider = DeleteLocationFamily();

/// See also [deleteLocation].
class DeleteLocationFamily extends Family<AsyncValue<String>> {
  /// See also [deleteLocation].
  const DeleteLocationFamily();

  /// See also [deleteLocation].
  DeleteLocationProvider call({
    required int id,
  }) {
    return DeleteLocationProvider(
      id: id,
    );
  }

  @override
  DeleteLocationProvider getProviderOverride(
    covariant DeleteLocationProvider provider,
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
  String? get name => r'deleteLocationProvider';
}

/// See also [deleteLocation].
class DeleteLocationProvider extends AutoDisposeFutureProvider<String> {
  /// See also [deleteLocation].
  DeleteLocationProvider({
    required int id,
  }) : this._internal(
          (ref) => deleteLocation(
            ref as DeleteLocationRef,
            id: id,
          ),
          from: deleteLocationProvider,
          name: r'deleteLocationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteLocationHash,
          dependencies: DeleteLocationFamily._dependencies,
          allTransitiveDependencies:
              DeleteLocationFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteLocationProvider._internal(
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
    FutureOr<String> Function(DeleteLocationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteLocationProvider._internal(
        (ref) => create(ref as DeleteLocationRef),
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
  AutoDisposeFutureProviderElement<String> createElement() {
    return _DeleteLocationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteLocationProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteLocationRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteLocationProviderElement
    extends AutoDisposeFutureProviderElement<String> with DeleteLocationRef {
  _DeleteLocationProviderElement(super.provider);

  @override
  int get id => (origin as DeleteLocationProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addLocationHash() => r'e28b67d86761a0af16796ade06780941a14693bd';

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
    required String phone,
    bool isMeChecked = false,
    required String landmark,
  }) {
    return AddLocationProvider(
      title: title,
      phone: phone,
      isMeChecked: isMeChecked,
      landmark: landmark,
    );
  }

  @override
  AddLocationProvider getProviderOverride(
    covariant AddLocationProvider provider,
  ) {
    return call(
      title: provider.title,
      phone: provider.phone,
      isMeChecked: provider.isMeChecked,
      landmark: provider.landmark,
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
    required String phone,
    bool isMeChecked = false,
    required String landmark,
  }) : this._internal(
          (ref) => addLocation(
            ref as AddLocationRef,
            title: title,
            phone: phone,
            isMeChecked: isMeChecked,
            landmark: landmark,
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
          isMeChecked: isMeChecked,
          landmark: landmark,
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
    required this.isMeChecked,
    required this.landmark,
  }) : super.internal();

  final String title;
  final String phone;
  final bool isMeChecked;
  final String landmark;

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
        isMeChecked: isMeChecked,
        landmark: landmark,
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
        other.isMeChecked == isMeChecked &&
        other.landmark == landmark;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, isMeChecked.hashCode);
    hash = _SystemHash.combine(hash, landmark.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddLocationRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `phone` of this provider.
  String get phone;

  /// The parameter `isMeChecked` of this provider.
  bool get isMeChecked;

  /// The parameter `landmark` of this provider.
  String get landmark;
}

class _AddLocationProviderElement
    extends AutoDisposeFutureProviderElement<String> with AddLocationRef {
  _AddLocationProviderElement(super.provider);

  @override
  String get title => (origin as AddLocationProvider).title;
  @override
  String get phone => (origin as AddLocationProvider).phone;
  @override
  bool get isMeChecked => (origin as AddLocationProvider).isMeChecked;
  @override
  String get landmark => (origin as AddLocationProvider).landmark;
}

String _$getLocationsHash() => r'2b94e1fdce594a7c5267b3de660f5758a99db427';

/// See also [getLocations].
@ProviderFor(getLocations)
final getLocationsProvider = AutoDisposeFutureProvider<List<Location>>.internal(
  getLocations,
  name: r'getLocationsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getLocationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetLocationsRef = AutoDisposeFutureProviderRef<List<Location>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

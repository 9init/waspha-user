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

typedef AddLocationRef = AutoDisposeFutureProviderRef<String>;

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
    required this.title,
    required this.phone,
    this.isMeChecked = false,
    required this.landmark,
  }) : super.internal(
          (ref) => addLocation(
            ref,
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
        );

  final String title;
  final String phone;
  final bool isMeChecked;
  final String landmark;

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

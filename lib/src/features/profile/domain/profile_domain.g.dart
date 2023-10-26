// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editProfileHash() => r'da8c6d6343e07a71c80b613a41e029fd845b8639';

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

typedef EditProfileRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [editProfile].
@ProviderFor(editProfile)
const editProfileProvider = EditProfileFamily();

/// See also [editProfile].
class EditProfileFamily extends Family<AsyncValue<dynamic>> {
  /// See also [editProfile].
  const EditProfileFamily();

  /// See also [editProfile].
  EditProfileProvider call({
    required String name,
    required String dob,
    String language = "en",
    String gender = "male",
    required BuildContext context,
  }) {
    return EditProfileProvider(
      name: name,
      dob: dob,
      language: language,
      gender: gender,
      context: context,
    );
  }

  @override
  EditProfileProvider getProviderOverride(
    covariant EditProfileProvider provider,
  ) {
    return call(
      name: provider.name,
      dob: provider.dob,
      language: provider.language,
      gender: provider.gender,
      context: provider.context,
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
  String? get name => r'editProfileProvider';
}

/// See also [editProfile].
class EditProfileProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [editProfile].
  EditProfileProvider({
    required this.name,
    required this.dob,
    this.language = "en",
    this.gender = "male",
    required this.context,
  }) : super.internal(
          (ref) => editProfile(
            ref,
            name: name,
            dob: dob,
            language: language,
            gender: gender,
            context: context,
          ),
          from: editProfileProvider,
          name: r'editProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editProfileHash,
          dependencies: EditProfileFamily._dependencies,
          allTransitiveDependencies:
              EditProfileFamily._allTransitiveDependencies,
        );

  final String name;
  final String dob;
  final String language;
  final String gender;
  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is EditProfileProvider &&
        other.name == name &&
        other.dob == dob &&
        other.language == language &&
        other.gender == gender &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);
    hash = _SystemHash.combine(hash, dob.hashCode);
    hash = _SystemHash.combine(hash, language.hashCode);
    hash = _SystemHash.combine(hash, gender.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

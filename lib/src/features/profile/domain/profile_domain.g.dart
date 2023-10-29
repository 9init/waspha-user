// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editProfileHash() => r'fcafdc815372c4671e8804e66c4c248950f16e3e';

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

/// See also [editProfile].
@ProviderFor(editProfile)
const editProfileProvider = EditProfileFamily();

/// See also [editProfile].
class EditProfileFamily extends Family<AsyncValue<bool>> {
  /// See also [editProfile].
  const EditProfileFamily();

  /// See also [editProfile].
  EditProfileProvider call({
    required String userName,
    required String dob,
    String language = "en",
    String gender = "male",
    required BuildContext context,
  }) {
    return EditProfileProvider(
      userName: userName,
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
      userName: provider.userName,
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
class EditProfileProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [editProfile].
  EditProfileProvider({
    required String userName,
    required String dob,
    String language = "en",
    String gender = "male",
    required BuildContext context,
  }) : this._internal(
          (ref) => editProfile(
            ref as EditProfileRef,
            userName: userName,
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
          userName: userName,
          dob: dob,
          language: language,
          gender: gender,
          context: context,
        );

  EditProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userName,
    required this.dob,
    required this.language,
    required this.gender,
    required this.context,
  }) : super.internal();

  final String userName;
  final String dob;
  final String language;
  final String gender;
  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<bool> Function(EditProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EditProfileProvider._internal(
        (ref) => create(ref as EditProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userName: userName,
        dob: dob,
        language: language,
        gender: gender,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _EditProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditProfileProvider &&
        other.userName == userName &&
        other.dob == dob &&
        other.language == language &&
        other.gender == gender &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, dob.hashCode);
    hash = _SystemHash.combine(hash, language.hashCode);
    hash = _SystemHash.combine(hash, gender.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditProfileRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `userName` of this provider.
  String get userName;

  /// The parameter `dob` of this provider.
  String get dob;

  /// The parameter `language` of this provider.
  String get language;

  /// The parameter `gender` of this provider.
  String get gender;

  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _EditProfileProviderElement extends AutoDisposeFutureProviderElement<bool>
    with EditProfileRef {
  _EditProfileProviderElement(super.provider);

  @override
  String get userName => (origin as EditProfileProvider).userName;
  @override
  String get dob => (origin as EditProfileProvider).dob;
  @override
  String get language => (origin as EditProfileProvider).language;
  @override
  String get gender => (origin as EditProfileProvider).gender;
  @override
  BuildContext get context => (origin as EditProfileProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

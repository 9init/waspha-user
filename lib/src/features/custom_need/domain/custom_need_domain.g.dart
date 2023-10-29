// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_need_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createRFPHash() => r'c2873a54d8a7b1af696535fcf1e15c9bb43ef079';

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

/// See also [createRFP].
@ProviderFor(createRFP)
const createRFPProvider = CreateRFPFamily();

/// See also [createRFP].
class CreateRFPFamily extends Family<AsyncValue> {
  /// See also [createRFP].
  const CreateRFPFamily();

  /// See also [createRFP].
  CreateRFPProvider call({
    required List<Map<String, dynamic>> items,
    required BuildContext context,
    String type = "delivery",
  }) {
    return CreateRFPProvider(
      items: items,
      context: context,
      type: type,
    );
  }

  @override
  CreateRFPProvider getProviderOverride(
    covariant CreateRFPProvider provider,
  ) {
    return call(
      items: provider.items,
      context: provider.context,
      type: provider.type,
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
  String? get name => r'createRFPProvider';
}

/// See also [createRFP].
class CreateRFPProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [createRFP].
  CreateRFPProvider({
    required List<Map<String, dynamic>> items,
    required BuildContext context,
    String type = "delivery",
  }) : this._internal(
          (ref) => createRFP(
            ref as CreateRFPRef,
            items: items,
            context: context,
            type: type,
          ),
          from: createRFPProvider,
          name: r'createRFPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createRFPHash,
          dependencies: CreateRFPFamily._dependencies,
          allTransitiveDependencies: CreateRFPFamily._allTransitiveDependencies,
          items: items,
          context: context,
          type: type,
        );

  CreateRFPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.items,
    required this.context,
    required this.type,
  }) : super.internal();

  final List<Map<String, dynamic>> items;
  final BuildContext context;
  final String type;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(CreateRFPRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateRFPProvider._internal(
        (ref) => create(ref as CreateRFPRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        items: items,
        context: context,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _CreateRFPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateRFPProvider &&
        other.items == items &&
        other.context == context &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, items.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateRFPRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `items` of this provider.
  List<Map<String, dynamic>> get items;

  /// The parameter `context` of this provider.
  BuildContext get context;

  /// The parameter `type` of this provider.
  String get type;
}

class _CreateRFPProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with CreateRFPRef {
  _CreateRFPProviderElement(super.provider);

  @override
  List<Map<String, dynamic>> get items => (origin as CreateRFPProvider).items;
  @override
  BuildContext get context => (origin as CreateRFPProvider).context;
  @override
  String get type => (origin as CreateRFPProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

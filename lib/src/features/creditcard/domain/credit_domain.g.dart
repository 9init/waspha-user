// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addCreditCardHash() => r'6a23e5179176608a4e64852ba4c393061f23c4f1';

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

/// See also [addCreditCard].
@ProviderFor(addCreditCard)
const addCreditCardProvider = AddCreditCardFamily();

/// See also [addCreditCard].
class AddCreditCardFamily extends Family<AsyncValue<String>> {
  /// See also [addCreditCard].
  const AddCreditCardFamily();

  /// See also [addCreditCard].
  AddCreditCardProvider call({
    required String cardNumber,
    required String cardName,
    required String cvv,
    required int expMonth,
    required int expYear,
  }) {
    return AddCreditCardProvider(
      cardNumber: cardNumber,
      cardName: cardName,
      cvv: cvv,
      expMonth: expMonth,
      expYear: expYear,
    );
  }

  @override
  AddCreditCardProvider getProviderOverride(
    covariant AddCreditCardProvider provider,
  ) {
    return call(
      cardNumber: provider.cardNumber,
      cardName: provider.cardName,
      cvv: provider.cvv,
      expMonth: provider.expMonth,
      expYear: provider.expYear,
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
  String? get name => r'addCreditCardProvider';
}

/// See also [addCreditCard].
class AddCreditCardProvider extends AutoDisposeFutureProvider<String> {
  /// See also [addCreditCard].
  AddCreditCardProvider({
    required String cardNumber,
    required String cardName,
    required String cvv,
    required int expMonth,
    required int expYear,
  }) : this._internal(
          (ref) => addCreditCard(
            ref as AddCreditCardRef,
            cardNumber: cardNumber,
            cardName: cardName,
            cvv: cvv,
            expMonth: expMonth,
            expYear: expYear,
          ),
          from: addCreditCardProvider,
          name: r'addCreditCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addCreditCardHash,
          dependencies: AddCreditCardFamily._dependencies,
          allTransitiveDependencies:
              AddCreditCardFamily._allTransitiveDependencies,
          cardNumber: cardNumber,
          cardName: cardName,
          cvv: cvv,
          expMonth: expMonth,
          expYear: expYear,
        );

  AddCreditCardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cardNumber,
    required this.cardName,
    required this.cvv,
    required this.expMonth,
    required this.expYear,
  }) : super.internal();

  final String cardNumber;
  final String cardName;
  final String cvv;
  final int expMonth;
  final int expYear;

  @override
  Override overrideWith(
    FutureOr<String> Function(AddCreditCardRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddCreditCardProvider._internal(
        (ref) => create(ref as AddCreditCardRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cardNumber: cardNumber,
        cardName: cardName,
        cvv: cvv,
        expMonth: expMonth,
        expYear: expYear,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _AddCreditCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddCreditCardProvider &&
        other.cardNumber == cardNumber &&
        other.cardName == cardName &&
        other.cvv == cvv &&
        other.expMonth == expMonth &&
        other.expYear == expYear;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cardNumber.hashCode);
    hash = _SystemHash.combine(hash, cardName.hashCode);
    hash = _SystemHash.combine(hash, cvv.hashCode);
    hash = _SystemHash.combine(hash, expMonth.hashCode);
    hash = _SystemHash.combine(hash, expYear.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddCreditCardRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `cardNumber` of this provider.
  String get cardNumber;

  /// The parameter `cardName` of this provider.
  String get cardName;

  /// The parameter `cvv` of this provider.
  String get cvv;

  /// The parameter `expMonth` of this provider.
  int get expMonth;

  /// The parameter `expYear` of this provider.
  int get expYear;
}

class _AddCreditCardProviderElement
    extends AutoDisposeFutureProviderElement<String> with AddCreditCardRef {
  _AddCreditCardProviderElement(super.provider);

  @override
  String get cardNumber => (origin as AddCreditCardProvider).cardNumber;
  @override
  String get cardName => (origin as AddCreditCardProvider).cardName;
  @override
  String get cvv => (origin as AddCreditCardProvider).cvv;
  @override
  int get expMonth => (origin as AddCreditCardProvider).expMonth;
  @override
  int get expYear => (origin as AddCreditCardProvider).expYear;
}

String _$getCreditCardsHash() => r'beccb40c69afa2d60247f52e4f7b39d8f25b7109';

/// See also [getCreditCards].
@ProviderFor(getCreditCards)
final getCreditCardsProvider = AutoDisposeFutureProvider<dynamic>.internal(
  getCreditCards,
  name: r'getCreditCardsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCreditCardsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCreditCardsRef = AutoDisposeFutureProviderRef<dynamic>;
String _$deleteCreditCardHash() => r'987f7512b993fcd5e6d2d018ea4db4742d4d7945';

/// See also [deleteCreditCard].
@ProviderFor(deleteCreditCard)
const deleteCreditCardProvider = DeleteCreditCardFamily();

/// See also [deleteCreditCard].
class DeleteCreditCardFamily extends Family<AsyncValue<String>> {
  /// See also [deleteCreditCard].
  const DeleteCreditCardFamily();

  /// See also [deleteCreditCard].
  DeleteCreditCardProvider call({
    required int id,
  }) {
    return DeleteCreditCardProvider(
      id: id,
    );
  }

  @override
  DeleteCreditCardProvider getProviderOverride(
    covariant DeleteCreditCardProvider provider,
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
  String? get name => r'deleteCreditCardProvider';
}

/// See also [deleteCreditCard].
class DeleteCreditCardProvider extends AutoDisposeFutureProvider<String> {
  /// See also [deleteCreditCard].
  DeleteCreditCardProvider({
    required int id,
  }) : this._internal(
          (ref) => deleteCreditCard(
            ref as DeleteCreditCardRef,
            id: id,
          ),
          from: deleteCreditCardProvider,
          name: r'deleteCreditCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteCreditCardHash,
          dependencies: DeleteCreditCardFamily._dependencies,
          allTransitiveDependencies:
              DeleteCreditCardFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteCreditCardProvider._internal(
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
    FutureOr<String> Function(DeleteCreditCardRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteCreditCardProvider._internal(
        (ref) => create(ref as DeleteCreditCardRef),
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
    return _DeleteCreditCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteCreditCardProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteCreditCardRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteCreditCardProviderElement
    extends AutoDisposeFutureProviderElement<String> with DeleteCreditCardRef {
  _DeleteCreditCardProviderElement(super.provider);

  @override
  int get id => (origin as DeleteCreditCardProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

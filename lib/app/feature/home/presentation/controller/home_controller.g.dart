// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeControllerHash() => r'a6fd943d58e4103e431352eee726f02b57c95e59';

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

abstract class _$HomeController
    extends BuildlessAutoDisposeStreamNotifier<List<HomeEntity>> {
  late final String userID;

  Stream<List<HomeEntity>> build(
    String userID,
  );
}

/// See also [HomeController].
@ProviderFor(HomeController)
const homeControllerProvider = HomeControllerFamily();

/// See also [HomeController].
class HomeControllerFamily extends Family<AsyncValue<List<HomeEntity>>> {
  /// See also [HomeController].
  const HomeControllerFamily();

  /// See also [HomeController].
  HomeControllerProvider call(
    String userID,
  ) {
    return HomeControllerProvider(
      userID,
    );
  }

  @override
  HomeControllerProvider getProviderOverride(
    covariant HomeControllerProvider provider,
  ) {
    return call(
      provider.userID,
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
  String? get name => r'homeControllerProvider';
}

/// See also [HomeController].
class HomeControllerProvider extends AutoDisposeStreamNotifierProviderImpl<
    HomeController, List<HomeEntity>> {
  /// See also [HomeController].
  HomeControllerProvider(
    String userID,
  ) : this._internal(
          () => HomeController()..userID = userID,
          from: homeControllerProvider,
          name: r'homeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$homeControllerHash,
          dependencies: HomeControllerFamily._dependencies,
          allTransitiveDependencies:
              HomeControllerFamily._allTransitiveDependencies,
          userID: userID,
        );

  HomeControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userID,
  }) : super.internal();

  final String userID;

  @override
  Stream<List<HomeEntity>> runNotifierBuild(
    covariant HomeController notifier,
  ) {
    return notifier.build(
      userID,
    );
  }

  @override
  Override overrideWith(HomeController Function() create) {
    return ProviderOverride(
      origin: this,
      override: HomeControllerProvider._internal(
        () => create()..userID = userID,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userID: userID,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<HomeController, List<HomeEntity>>
      createElement() {
    return _HomeControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HomeControllerProvider && other.userID == userID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HomeControllerRef
    on AutoDisposeStreamNotifierProviderRef<List<HomeEntity>> {
  /// The parameter `userID` of this provider.
  String get userID;
}

class _HomeControllerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<HomeController,
        List<HomeEntity>> with HomeControllerRef {
  _HomeControllerProviderElement(super.provider);

  @override
  String get userID => (origin as HomeControllerProvider).userID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$roomControllerHash() => r'b563774c50fb0a26c75fa7338f406f9a4f014d45';

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

abstract class _$RoomController
    extends BuildlessAutoDisposeStreamNotifier<List<RoomEntity>> {
  late final String homeId;

  Stream<List<RoomEntity>> build(
    String homeId,
  );
}

/// See also [RoomController].
@ProviderFor(RoomController)
const roomControllerProvider = RoomControllerFamily();

/// See also [RoomController].
class RoomControllerFamily extends Family<AsyncValue<List<RoomEntity>>> {
  /// See also [RoomController].
  const RoomControllerFamily();

  /// See also [RoomController].
  RoomControllerProvider call(
    String homeId,
  ) {
    return RoomControllerProvider(
      homeId,
    );
  }

  @override
  RoomControllerProvider getProviderOverride(
    covariant RoomControllerProvider provider,
  ) {
    return call(
      provider.homeId,
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
  String? get name => r'roomControllerProvider';
}

/// See also [RoomController].
class RoomControllerProvider extends AutoDisposeStreamNotifierProviderImpl<
    RoomController, List<RoomEntity>> {
  /// See also [RoomController].
  RoomControllerProvider(
    String homeId,
  ) : this._internal(
          () => RoomController()..homeId = homeId,
          from: roomControllerProvider,
          name: r'roomControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomControllerHash,
          dependencies: RoomControllerFamily._dependencies,
          allTransitiveDependencies:
              RoomControllerFamily._allTransitiveDependencies,
          homeId: homeId,
        );

  RoomControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.homeId,
  }) : super.internal();

  final String homeId;

  @override
  Stream<List<RoomEntity>> runNotifierBuild(
    covariant RoomController notifier,
  ) {
    return notifier.build(
      homeId,
    );
  }

  @override
  Override overrideWith(RoomController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RoomControllerProvider._internal(
        () => create()..homeId = homeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        homeId: homeId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<RoomController, List<RoomEntity>>
      createElement() {
    return _RoomControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomControllerProvider && other.homeId == homeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, homeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RoomControllerRef
    on AutoDisposeStreamNotifierProviderRef<List<RoomEntity>> {
  /// The parameter `homeId` of this provider.
  String get homeId;
}

class _RoomControllerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<RoomController,
        List<RoomEntity>> with RoomControllerRef {
  _RoomControllerProviderElement(super.provider);

  @override
  String get homeId => (origin as RoomControllerProvider).homeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

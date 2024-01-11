// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceControllerHash() => r'6cc12b04090d314fc642060b47cf485453efb52b';

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

abstract class _$DeviceController
    extends BuildlessAutoDisposeStreamNotifier<List<DeviceEntity>> {
  late final String roomId;

  Stream<List<DeviceEntity>> build(
    String roomId,
  );
}

/// See also [DeviceController].
@ProviderFor(DeviceController)
const deviceControllerProvider = DeviceControllerFamily();

/// See also [DeviceController].
class DeviceControllerFamily extends Family<AsyncValue<List<DeviceEntity>>> {
  /// See also [DeviceController].
  const DeviceControllerFamily();

  /// See also [DeviceController].
  DeviceControllerProvider call(
    String roomId,
  ) {
    return DeviceControllerProvider(
      roomId,
    );
  }

  @override
  DeviceControllerProvider getProviderOverride(
    covariant DeviceControllerProvider provider,
  ) {
    return call(
      provider.roomId,
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
  String? get name => r'deviceControllerProvider';
}

/// See also [DeviceController].
class DeviceControllerProvider extends AutoDisposeStreamNotifierProviderImpl<
    DeviceController, List<DeviceEntity>> {
  /// See also [DeviceController].
  DeviceControllerProvider(
    String roomId,
  ) : this._internal(
          () => DeviceController()..roomId = roomId,
          from: deviceControllerProvider,
          name: r'deviceControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deviceControllerHash,
          dependencies: DeviceControllerFamily._dependencies,
          allTransitiveDependencies:
              DeviceControllerFamily._allTransitiveDependencies,
          roomId: roomId,
        );

  DeviceControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roomId,
  }) : super.internal();

  final String roomId;

  @override
  Stream<List<DeviceEntity>> runNotifierBuild(
    covariant DeviceController notifier,
  ) {
    return notifier.build(
      roomId,
    );
  }

  @override
  Override overrideWith(DeviceController Function() create) {
    return ProviderOverride(
      origin: this,
      override: DeviceControllerProvider._internal(
        () => create()..roomId = roomId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roomId: roomId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<DeviceController, List<DeviceEntity>>
      createElement() {
    return _DeviceControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceControllerProvider && other.roomId == roomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeviceControllerRef
    on AutoDisposeStreamNotifierProviderRef<List<DeviceEntity>> {
  /// The parameter `roomId` of this provider.
  String get roomId;
}

class _DeviceControllerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<DeviceController,
        List<DeviceEntity>> with DeviceControllerRef {
  _DeviceControllerProviderElement(super.provider);

  @override
  String get roomId => (origin as DeviceControllerProvider).roomId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

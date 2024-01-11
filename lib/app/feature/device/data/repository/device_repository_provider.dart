import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_home/app/feature/device/data/data_source/device_data_source_provider.dart';
import 'package:smart_home/app/feature/device/data/repository/device_repository.dart';

final deviceRepositoryProvider = Provider.autoDispose((ref) =>
    DeviceRepository.create(
        remoteDataSource: ref.watch(deviceRemoteDataSourceProvider)));

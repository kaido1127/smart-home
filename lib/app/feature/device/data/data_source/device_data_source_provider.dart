import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_home/app/feature/device/data/data_source/device_remote_data_source.dart';
import 'package:smart_home/app/shared/application/firestore_provider.dart';

final deviceRemoteDataSourceProvider = Provider.autoDispose((ref) =>
    DeviceRemoteDataSource.create(firestore: ref.watch(firestoreProvider)));

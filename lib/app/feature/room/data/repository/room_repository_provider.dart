import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_home/app/feature/room/data/data_source/room_data_source_provider.dart';
import 'package:smart_home/app/feature/room/data/repository/room_repository.dart';

final roomRepositoryProvider = Provider.autoDispose<RoomRepository>((ref) =>
    RoomRepository.create(
        remoteDataSource: ref.watch(roomRemoteDataSourceProvider)));

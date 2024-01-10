import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_home/app/feature/room/data/data_source/room_remote_data_source.dart';
import 'package:smart_home/app/shared/application/firestore_provider.dart';

final roomRemoteDataSourceProvider = Provider.autoDispose<RoomRemoteDataSource>(
    (ref) =>
        RoomRemoteDataSource.create(firestore: ref.watch(firestoreProvider)));

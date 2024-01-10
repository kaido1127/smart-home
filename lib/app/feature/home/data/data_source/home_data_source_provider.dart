import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_home/app/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:smart_home/app/feature/shared/application/firestore_provider.dart';

final homeRemoteDataSourceProvider = Provider.autoDispose<HomeRemoteDataSource>(
    (ref) =>
        HomeRemoteDataSource.create(firestore: ref.watch(firestoreProvider)));

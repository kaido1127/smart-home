import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_home/app/feature/home/data/data_source/home_data_source_provider.dart';
import 'package:smart_home/app/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:smart_home/app/feature/home/data/repository/home_repository.dart';

final homeRepositoryProvider = Provider.autoDispose<HomeRepository>((ref) =>
    HomeRepository.create(
        remoteDataSource: ref.watch(homeRemoteDataSourceProvider)));

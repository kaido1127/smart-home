import 'package:smart_home/app/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:smart_home/app/feature/home/domain/home_entity.dart';

part 'home_repository_impl.dart';

abstract interface class HomeRepository {
  Future<void> createHome({required HomeEntity homeEntity});
  Future<void> removeHome({required String homeId});
  Future<void> updateHome({required HomeEntity homeEntity});
  Stream<List<HomeEntity>> getAllHome({required String userID});

  factory HomeRepository.create(
          {required HomeRemoteDataSource remoteDataSource}) =>
      _HomeRepositoryImpl(remoteDataSource: remoteDataSource);
}

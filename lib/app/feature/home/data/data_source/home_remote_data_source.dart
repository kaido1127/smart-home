import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_home/app/feature/home/data/model/home_model.dart';
import 'package:smart_home/app/shared/helpper/firebase_extention_function.dart';

part 'home_remote_data_source_impl.dart';

abstract interface class HomeRemoteDataSource {
  Future<void> createHome({required HomeModel homeModel});
  Future<void> removeHome({required String homeId});
  Future<void> updateHome({required HomeModel homeModel});
  Stream<List<HomeModel>> getAllHome({required String userID});

  factory HomeRemoteDataSource.create({required FirebaseFirestore firestore}) =>
      _HomeRemoteDataSourceImpl(firestore: firestore);
}

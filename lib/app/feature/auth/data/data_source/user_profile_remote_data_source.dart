import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

part 'user_profile_remote_data_source_impl.dart';

abstract interface class UserProfileRemoteDataSource {
  Future<UserModel> createUserFromUserModel({required UserModel userModel});

  Future<UserModel?> getUserInfoFromId({required String id});

  factory UserProfileRemoteDataSource.create(
          {required FirebaseFirestore firestore}) =>
      _UserProfileRemoteDataSourceImpl(firestore: firestore);
}

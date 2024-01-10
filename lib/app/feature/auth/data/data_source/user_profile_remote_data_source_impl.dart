part of 'user_profile_remote_data_source.dart';

class _UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  final FirebaseFirestore _firestore;

  _UserProfileRemoteDataSourceImpl({required FirebaseFirestore firestore}) : _firestore = firestore;

  
  @override
  Future<UserModel> createUserFromUserModel({required UserModel userModel}) async {
    try {
      await _firestore.collection('users').doc(userModel.id).set(userModel.toJson());
      return userModel;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<UserModel?> getUserInfoFromId({required String id}) async {
    final user = await _firestore.collection('users').doc(id).get();

    return (user.data() == null) ? null : UserModel.fromJson(user.data()!);
  }
}

part of 'auth_remote_data_source.dart';

class _AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;

  _AuthRemoteDataSourceImpl({required FirebaseAuth auth}) : _auth = auth;

  @override
  Future<User?> login() async {
    try {
      final userCredential = await signInWithGoogle();

      if (userCredential != null) {
        return userCredential.user;
      }
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      await InternetAddress.lookup('google.com');
    }
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}

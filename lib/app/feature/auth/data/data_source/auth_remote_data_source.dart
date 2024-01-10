import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_remote_data_source_impl.dart';

abstract interface class AuthRemoteDataSource {
  User? getCurrentUser();

  Future<User?> login();

  Future<void> logout();

  factory AuthRemoteDataSource.create({required FirebaseAuth auth}) =>
      _AuthRemoteDataSourceImpl(auth: auth);
}

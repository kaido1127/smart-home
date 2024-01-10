import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_source/auth_remote_data_source.dart';
import '../data_source/user_profile_remote_data_source.dart';
import 'auth_repository.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) => AuthRepository.create(
    authRemoteDataSource: AuthRemoteDataSource.create(auth: FirebaseAuth.instance),
    userProfileRemoteDataSource:
        UserProfileRemoteDataSource.create(firestore: FirebaseFirestore.instance)));

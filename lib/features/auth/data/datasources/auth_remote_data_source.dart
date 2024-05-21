import 'package:firebase_auth/firebase_auth.dart';

import '../models/auth_user_model.dart';

abstract class AuthRemoteDataSource {
  Stream<AuthUserModel?> get user;

  Future<AuthUserModel> signUp({required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  @override
  Stream<AuthUserModel?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }
      return AuthUserModel.fromFirebaseAuthUser(firebaseUser);
    });
  }

  @override
  Future<AuthUserModel> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw Exception('Sign up failed.');
      }

      return AuthUserModel.fromFirebaseAuthUser(credential.user!);
    } catch (error) {
      throw Exception('Sign up failed: $error');
    }
  }
}

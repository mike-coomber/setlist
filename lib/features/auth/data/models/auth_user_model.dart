import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/auth_user.dart';

class AuthUserModel extends AuthUser {
  const AuthUserModel({
    required super.id,
    required super.email,
    super.name,
    super.profilePictureUrl,
  });

  factory AuthUserModel.fromFirebaseAuthUser(
    User firebaseUser,
  ) {
    return AuthUserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName,
      profilePictureUrl: firebaseUser.photoURL,
    );
  }
}

import 'package:setlist/features/auth/domain/entities/auth_user.dart';

abstract class AuthRepository {
  Stream<AuthUser?> get user;

  Future<AuthUser> signup({
    required String email,
    required String password,
  });

  Future<AuthUser> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}

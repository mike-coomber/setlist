import 'package:setlist/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:setlist/features/auth/domain/entities/auth_user.dart';
import 'package:setlist/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Stream<AuthUser?> get user {
    return authRemoteDataSource.user.map((authUserModel) {
      return authUserModel;
    });
  }

  @override
  Future<AuthUser> login({required String email, required String password}) async {
    final authUserModel = await authRemoteDataSource.login(
      email: email,
      password: password,
    );

    return authUserModel;
  }

  @override
  Future<void> logout() {
    return authRemoteDataSource.logout();
  }

  @override
  Future<AuthUser> signup({required String email, required String password}) async {
    final authUserModel = await authRemoteDataSource.signUp(
      email: email,
      password: password,
    );

    return authUserModel;
  }
}

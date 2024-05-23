import 'package:setlist/features/auth/domain/entities/auth_user.dart';
import 'package:setlist/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});

  Future<AuthUser> call({required String email, required String password}) {
    try {
      return authRepository.login(email: email, password: password);
    } catch (error) {
      throw Exception(error);
    }
  }
}

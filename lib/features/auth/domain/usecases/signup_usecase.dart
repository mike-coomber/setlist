import 'package:setlist/features/auth/domain/entities/auth_user.dart';
import 'package:setlist/features/auth/domain/repositories/auth_repository.dart';

class SignupUsecase {
  final AuthRepository authRepository;

  SignupUsecase({required this.authRepository});

  Future<AuthUser> call({required String email, required String password}) {
    try {
      return authRepository.signup(email: email, password: password);
    } catch (error) {
      throw Exception(error);
    }
  }
}

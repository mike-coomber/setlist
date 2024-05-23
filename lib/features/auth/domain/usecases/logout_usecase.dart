import 'package:setlist/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  Future<void> call() {
    try {
      return authRepository.logout();
    } catch (error) {
      throw Exception(error);
    }
  }
}

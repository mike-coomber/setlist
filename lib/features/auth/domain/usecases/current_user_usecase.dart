import 'package:setlist/features/auth/domain/entities/auth_user.dart';
import 'package:setlist/features/auth/domain/repositories/auth_repository.dart';

class CurrentUserUsecase {
  final AuthRepository authRepository;

  CurrentUserUsecase({required this.authRepository});

  Stream<AuthUser?> call() => authRepository.user;
}

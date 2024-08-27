import 'package:setlist/core/domain/repositories/musician_repository.dart';
import 'package:setlist/features/auth/domain/entities/auth_user.dart';
import 'package:setlist/features/auth/domain/repositories/auth_repository.dart';

class SignupUsecase {
  final AuthRepository authRepository;
  final MusicianRepository musicianRepository;

  SignupUsecase({
    required this.authRepository,
    required this.musicianRepository,
  });

  Future<AuthUser> call({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await authRepository.signup(email: email, password: password);
      await musicianRepository.createMusician(
        id: user.id,
        name: name,
      );

      return user;
    } catch (error) {
      throw Exception(error);
    }
  }
}

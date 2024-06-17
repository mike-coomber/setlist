import 'package:setlist/features/dashboard/domain/repositories/musician_repository.dart';

import '../entities/musician.dart';

class GetMusicianUsecase {
  final MusicianRepository musicianRepository;

  GetMusicianUsecase({required this.musicianRepository});

  Future<Musician> call({required String userId}) {
    return musicianRepository.getMusician(userId);
  }
}

import 'package:setlist/features/dashboard/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/domain/repositories/musician_repository.dart';

class CreateMusicianUsecase {
  final MusicianRepository musicianRepository;

  CreateMusicianUsecase({required this.musicianRepository});

  Future<Musician> call({required String name}) {
    try {
      return musicianRepository.createMusician(name);
    } catch (e) {
      throw Error();
    }
  }
}

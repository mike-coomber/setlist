import 'package:setlist/core/domain/entities/musician.dart';
import 'package:setlist/core/domain/repositories/musician_repository.dart';

class CreateMusicianUsecase {
  final MusicianRepository musicianRepository;

  CreateMusicianUsecase({required this.musicianRepository});

  Future<Musician> call({required String name, required String id}) {
    return musicianRepository.createMusician(name: name, id: id);
  }
}

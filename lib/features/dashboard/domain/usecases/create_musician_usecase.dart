import 'package:setlist/features/dashboard/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/domain/repositories/musician_repository.dart';

class CreateMusicianUsecase {
  final MusicianRepository musicianRepository;

  CreateMusicianUsecase({required this.musicianRepository});

  Future<Musician> call({required String name, required String id}) {
    return musicianRepository.createMusician(name: name, id: id);
  }
}

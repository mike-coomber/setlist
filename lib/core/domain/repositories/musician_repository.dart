import '../entities/musician.dart';

abstract class MusicianRepository {
  Future<Musician> getMusician(String musicianId);

  Future<Musician> createMusician({required String name, required String id});

  Future<List<Musician>> getMusicians({required List<String> musicianIds});

  Future<List<Musician>> searchMusicians({
    required String searchStr,
    required List<String> currentMemberMusicianIds,
  });
}

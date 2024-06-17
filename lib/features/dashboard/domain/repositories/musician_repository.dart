import '../entities/musician.dart';

abstract class MusicianRepository {
  Future<Musician> getMusician(String musicianId);

  Future<Musician> createMusician({required String name, required String id});
}

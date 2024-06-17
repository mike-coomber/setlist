import 'package:setlist/features/dashboard/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/domain/repositories/musician_repository.dart';

class MusicianRepositoryImpl extends MusicianRepository {
  @override
  Future<Musician> createMusician({required String name, required String id}) {
    // TODO: implement createMusician
    throw UnimplementedError();
  }

  @override
  Future<Musician> getMusician(String musicianId) {
    // TODO: implement getMusician
    throw UnimplementedError();
  }
}

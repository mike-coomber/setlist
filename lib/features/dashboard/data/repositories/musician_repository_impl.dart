import 'package:setlist/features/dashboard/data/datasources/musician_remote_data_source.dart';
import 'package:setlist/features/dashboard/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/domain/repositories/musician_repository.dart';

class MusicianRepositoryImpl extends MusicianRepository {
  final MusicianRemoteDataSource remoteDataSource;

  MusicianRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Musician> createMusician({required String name, required String id}) {
    return remoteDataSource.createMusician(name: name, id: id);
  }

  @override
  Future<Musician> getMusician(String musicianId) {
    return remoteDataSource.getMusician(id: musicianId);
  }

  @override
  Future<List<Musician>> getMusicians({required List<String> musicianIds}) {
    return remoteDataSource.getMusicians(musicianIds: musicianIds);
  }
}

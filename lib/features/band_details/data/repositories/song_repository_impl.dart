import 'package:setlist/features/band_details/data/datasources/song_remote_datasource.dart';
import 'package:setlist/features/band_details/domain/entities/song.dart';
import 'package:setlist/features/band_details/domain/repositories/song_repository.dart';

class SongRepositoryImpl extends SongRepository {
  final SongRemoteDataSource remoteDataSource;

  SongRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addSong({
    required String songName,
    required String artist,
    required int? duration,
    required String bandId,
  }) {
    return remoteDataSource.addSong(
      songName: songName,
      artist: artist,
      duration: duration,
      bandId: bandId,
    );
  }

  @override
  Future<void> deleteSong({required String songId, required String bandId}) {
    // TODO: implement deleteSong
    throw UnimplementedError();
  }

  @override
  Future<Song> getSong({required String songId, required String bandId}) {
    // TODO: implement getSong
    throw UnimplementedError();
  }

  @override
  Future<List<Song>> getSongs({required String bandId}) {
    return remoteDataSource.getSongs(bandId: bandId);
  }
}

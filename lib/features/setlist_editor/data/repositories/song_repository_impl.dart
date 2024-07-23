import 'package:setlist/features/setlist_editor/data/datasources/song_remote_datasource.dart';
import 'package:setlist/features/setlist_editor/domain/entities/song.dart';
import 'package:setlist/features/setlist_editor/domain/repositoires/song_repository.dart';

class SongRepositoryImpl extends SongRepository {
  final SongRemoteDataSource songRemoteDataSource;

  SongRepositoryImpl({required this.songRemoteDataSource});

  @override
  Future<void> addSong({
    required String songName,
    required String artist,
    required int duration,
    required String bandId,
  }) {
    // TODO: implement addSong
    throw UnimplementedError();
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
}

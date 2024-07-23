import 'package:setlist/features/songs/domain/entities/song.dart';

abstract class SongRepository {
  Future<Song> getSong({required String songId, required String bandId});

  Future<List<Song>> getSongs({required String bandId});

  Future<void> addSong({
    required String songName,
    required String artist,
    required int duration,
    required String bandId,
  });

  Future<void> deleteSong({required String songId, required String bandId});
}

import 'package:setlist/features/setlist_editor/domain/entities/song.dart';

abstract class SongRepository {
  Future<Song> getSong({required String songId, required String bandId});

  Future<void> addSong({
    required String songName,
    required String artist,
    required int duration,
    required String bandId,
  });

  Future<void> deleteSong({required String songId, required String bandId});
}

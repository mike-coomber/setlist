import 'package:setlist/features/band_details/domain/repositories/song_repository.dart';

class AddSongUsecase {
  final SongRepository songRepository;

  AddSongUsecase({required this.songRepository});

  Future<void> call({
    required String songName,
    required String artist,
    required int? duration,
    required String bandId,
  }) async {
    return songRepository.addSong(
      songName: songName,
      artist: artist,
      duration: duration,
      bandId: bandId,
    );
  }
}

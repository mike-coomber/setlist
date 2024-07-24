import 'package:setlist/features/band_details/domain/entities/song.dart';
import 'package:setlist/features/band_details/domain/repositories/song_repository.dart';

class GetSongsUsecase {
  final SongRepository songRepository;

  GetSongsUsecase({required this.songRepository});

  Future<List<Song>> call({required String bandId}) {
    return songRepository.getSongs(bandId: bandId);
  }
}

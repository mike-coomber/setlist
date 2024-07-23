import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/features/songs/domain/entities/song.dart';
import 'package:setlist/features/songs/domain/usecases/get_songs_usecase.dart';

part 'song_list_state.dart';

class SongListCubit extends Cubit<SongListState> {
  final Band band;
  final GetSongsUsecase getSongUsecase;

  SongListCubit({
    required this.band,
    required this.getSongUsecase,
  }) : super(SongListInitial(band));

  Future<void> init() async {
    emit(SongListLoading(band));
    try {
      final songs = await getSongUsecase.call(bandId: band.id);
      emit(SongListLoaded(band: band, songs: songs));
    } catch (e) {
      emit(SongListError(band));
    }
  }
}

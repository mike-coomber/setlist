import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/features/auth/presentation/cubit/form_status.dart';
import 'package:setlist/features/band_details/domain/usecases/add_song_usecase.dart';

part 'add_song_state.dart';

class AddSongCubit extends Cubit<AddSongState> {
  AddSongCubit({
    required this.addSongUsecase,
    required this.band,
  }) : super(const AddSongState());

  final AddSongUsecase addSongUsecase;
  final Band band;

  void artistChanged(String value) {
    emit(state.copyWith(artist: value));
  }

  void titleChanged(String value) {
    emit(state.copyWith(title: value));
  }

  void durationChanged(int value) {
    emit(state.copyWith(duration: value));
  }

  Future<void> submit() async {
    if (state.title.isEmpty) {
      emit(state.copyWith(formStatus: FormStatus.invalid));
      return;
    }

    emit(state.copyWith(formStatus: FormStatus.loading));
    try {
      await addSongUsecase.call(
        artist: state.artist,
        songName: state.title,
        duration: state.duration,
        bandId: band.id,
      );
      emit(state.copyWith(formStatus: FormStatus.success));
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.error));
      return;
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/features/auth/presentation/cubit/form_status.dart';
import 'package:setlist/features/band_details/domain/entities/song.dart';
import 'package:setlist/features/band_details/domain/usecases/get_songs_usecase.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist_event.dart';
import 'package:setlist/features/setlist_editor/domain/usecases/save_setlist_usecase.dart';

part 'setlist_editor_state.dart';

class SetlistEditorCubit extends Cubit<SetlistEditorState> {
  final Band band;
  final String? _setlistId;
  final GetSongsUsecase getSongsUsecase;
  final SaveSetlistUsecase saveSetlistUsecase;

  SetlistEditorCubit({
    required this.band,
    Setlist? setlist,
    required this.getSongsUsecase,
    required this.saveSetlistUsecase,
  })  : _setlistId = setlist?.id,
        super(SetlistEditorState(
          events: setlist?.events ?? [],
          name: setlist?.name ?? '',
        ));

  void loadSongs() async {
    try {
      final songs = await getSongsUsecase.call(bandId: band.id);
      emit(state.copyWith(songs: songs));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void eventNameChanged(String value) {
    emit(state.copyWith(newEventName: value));
  }

  void setlistNameChanged(String value) {
    emit(state.copyWith(name: value));
  }

  void addSongEvent(Song song) {
    final newEvent = SetlistEvent(
      name: song.name,
      order: state.events.length + 1,
      length: song.duration ?? 0,
      notes: '',
      songId: song.id,
    );

    emit(
      state.copyWith(
        events: [...state.events, newEvent],
      ),
    );
  }

  void onEventNotesChanged(String notes, SetlistEvent event) {
    final events = state.events;
    final index = events.indexOf(event);
    events[index].notes = notes;
    emit(state.copyWith(events: events));
  }

  void addEvent() {
    if (state.newEventName.isEmpty) return;

    final newEvent = SetlistEvent(
      name: state.newEventName,
      order: state.events.length + 1,
      length: state.newEventLength ?? 0,
      notes: '',
      songId: null,
    );

    emit(
      state.copyWith(
        events: [...state.events, newEvent],
        newEventName: '',
        newEventLength: null,
      ),
    );
  }

  void removeEvent(SetlistEvent event) {
    final events = [...state.events];
    events.remove(event);
    for (int i = 0; i < events.length; i++) {
      events[i].order = i + 1;
    }
    emit(state.copyWith(events: events));
  }

  void reorderEvents(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final events = state.events;
    final event = events.removeAt(oldIndex);
    events.insert(newIndex, event);
    for (int i = 0; i < events.length; i++) {
      events[i].order = i + 1;
    }
    emit(state.copyWith(events: events));
  }

  Future<void> addSetList() async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      await saveSetlistUsecase.call(
        bandId: band.id,
        setlistName: state.name,
        events: state.events,
        setlistId: _setlistId,
      );
      emit(state.copyWith(status: FormStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }
}

part of 'setlist_editor_cubit.dart';

class SetlistEditorState extends Equatable {
  const SetlistEditorState({
    this.events = const [],
    this.name = '',
    this.status = FormStatus.initial,
    this.newEventName = '',
    this.newEventLength,
    this.songs = const [],
  });

  final List<SetlistEvent> events;
  final List<Song> songs;
  final String name;
  final String newEventName;
  final int? newEventLength;
  final FormStatus status;

  SetlistEditorState copyWith({
    List<SetlistEvent>? events,
    String? name,
    String? newEventName,
    FormStatus? status,
    int? newEventLength,
    List<Song>? songs,
  }) {
    return SetlistEditorState(
      events: events ?? this.events,
      name: name ?? this.name,
      newEventName: newEventName ?? this.newEventName,
      status: status ?? this.status,
      newEventLength: newEventLength,
      songs: songs ?? this.songs,
    );
  }

  @override
  List<Object> get props => [events, name, newEventName, status];
}

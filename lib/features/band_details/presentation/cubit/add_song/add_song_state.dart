part of 'add_song_cubit.dart';

class AddSongState extends Equatable {
  const AddSongState({
    this.formStatus = FormStatus.initial,
    this.artist = '',
    this.title = '',
    this.duration,
  });

  final FormStatus formStatus;
  final String artist;
  final String title;
  final int? duration;

  AddSongState copyWith({
    FormStatus? formStatus,
    String? artist,
    String? title,
    int? duration,
  }) {
    return AddSongState(
      formStatus: formStatus ?? this.formStatus,
      artist: artist ?? this.artist,
      title: title ?? this.title,
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object?> get props => [
        formStatus,
        artist,
        title,
        duration,
      ];
}

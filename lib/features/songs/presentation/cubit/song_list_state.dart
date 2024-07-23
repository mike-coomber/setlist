part of 'song_list_cubit.dart';

sealed class SongListState extends Equatable {
  final Band band;

  const SongListState(this.band);

  @override
  List<Object> get props => [];
}

final class SongListInitial extends SongListState {
  const SongListInitial(super.band);
}

final class SongListLoading extends SongListState {
  const SongListLoading(super.band);
}

final class SongListError extends SongListState {
  const SongListError(super.band);
}

final class SongListLoaded extends SongListState {
  final List<Song> songs;

  const SongListLoaded({
    required Band band,
    required this.songs,
  }) : super(band);

  SongListLoaded copyWith({
    Band? band,
    List<Song>? songs,
  }) =>
      SongListLoaded(
        band: band ?? this.band,
        songs: songs ?? this.songs,
      );

  @override
  List<Object> get props => [band, songs];
}

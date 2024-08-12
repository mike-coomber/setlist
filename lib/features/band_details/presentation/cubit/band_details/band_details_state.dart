part of 'band_details_cubit.dart';

sealed class BandDetailsState extends Equatable {
  final Band band;

  const BandDetailsState(this.band);

  @override
  List<Object> get props => [band];
}

final class BandDetailsStateInitial extends BandDetailsState {
  const BandDetailsStateInitial(super.band);
}

final class BandDetailsStateLoaded extends BandDetailsState {
  final List<Musician> members;
  final List<Song> songs;
  final List<Setlist> setlists;
  final Permissions permissions;

  const BandDetailsStateLoaded({
    required Band band,
    required this.members,
    required this.songs,
    required this.permissions,
    required this.setlists,
  }) : super(band);

  BandDetailsStateLoaded copyWith({
    Band? band,
    List<Musician>? members,
    Permissions? permissions,
    List<Song>? songs,
    List<Setlist>? setlists,
  }) =>
      BandDetailsStateLoaded(
        band: band ?? this.band,
        songs: songs ?? this.songs,
        members: members ?? this.members,
        permissions: permissions ?? this.permissions,
        setlists: setlists ?? this.setlists,
      );

  @override
  List<Object> get props => [band, members];
}

final class BandDetailsStateLoading extends BandDetailsState {
  const BandDetailsStateLoading(super.band);
}

final class BandDetailsStateError extends BandDetailsState {
  const BandDetailsStateError(super.band);
}

final class BandDetailsStateDeleted extends BandDetailsState {
  const BandDetailsStateDeleted(super.band);
}

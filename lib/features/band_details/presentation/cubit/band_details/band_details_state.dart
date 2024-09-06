part of 'band_details_cubit.dart';

sealed class BandDetailsState extends Equatable {
  final String bandId;

  const BandDetailsState(this.bandId);

  @override
  List<Object> get props => [bandId];
}

final class BandDetailsStateInitial extends BandDetailsState {
  const BandDetailsStateInitial(super.bandId);
}

final class BandDetailsStateLoaded extends BandDetailsState {
  final Band band;
  final List<Musician> members;
  final List<Song> songs;
  final List<Setlist> setlists;
  final Permissions permissions;
  final Membership currentMembership;

  const BandDetailsStateLoaded({
    required String bandId,
    required this.band,
    required this.members,
    required this.songs,
    required this.permissions,
    required this.setlists,
    required this.currentMembership,
  }) : super(bandId);

  BandDetailsStateLoaded copyWith({
    Band? band,
    List<Musician>? members,
    Permissions? permissions,
    Membership? currentMembership,
    List<Song>? songs,
    List<Setlist>? setlists,
  }) =>
      BandDetailsStateLoaded(
        bandId: bandId,
        band: band ?? this.band,
        songs: songs ?? this.songs,
        members: members ?? this.members,
        permissions: permissions ?? this.permissions,
        currentMembership: currentMembership ?? this.currentMembership,
        setlists: setlists ?? this.setlists,
      );

  @override
  List<Object> get props => [bandId, band, members, setlists, songs];
}

final class BandDetailsStateLoading extends BandDetailsState {
  const BandDetailsStateLoading(super.bandId);
}

final class BandDetailsStateError extends BandDetailsState {
  const BandDetailsStateError(super.bandId);
}

final class BandDetailsStateDeleted extends BandDetailsState {
  const BandDetailsStateDeleted(super.bandId);
}

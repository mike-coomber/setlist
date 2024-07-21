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
  final Role role;

  const BandDetailsStateLoaded({
    required Band band,
    required this.members,
    required this.role,
  }) : super(band);

  BandDetailsStateLoaded copyWith({
    Band? band,
    List<Musician>? members,
    Role? role,
  }) =>
      BandDetailsStateLoaded(
        band: band ?? this.band,
        members: members ?? this.members,
        role: role ?? this.role,
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

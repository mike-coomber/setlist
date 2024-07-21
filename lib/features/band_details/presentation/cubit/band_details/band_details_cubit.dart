import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/entities/musician.dart';
import 'package:setlist/core/domain/entities/role.dart';
import 'package:setlist/features/band_details/usecases/delete_band_usecase.dart';
import 'package:setlist/features/band_details/usecases/delete_membership_usecase.dart';
import 'package:setlist/features/band_details/usecases/get_band_members_usecase.dart';
import 'package:setlist/features/band_details/usecases/get_membership_usecase.dart';

part 'band_details_state.dart';

class BandDetailsCubit extends Cubit<BandDetailsState> {
  final Band band;
  final GetBandMembersUsecase getBandMembersUsecase;
  final DeleteBandUsecase deleteBandUsecase;
  final DeleteMembershipUsecase deleteMembershipUsecase;
  final GetMembershipUseCase getMembershipUseCase;

  late String userId;

  BandDetailsCubit({
    required this.band,
    required this.getBandMembersUsecase,
    required this.deleteBandUsecase,
    required this.deleteMembershipUsecase,
    required this.getMembershipUseCase,
  }) : super(BandDetailsStateInitial(band));

  Future<void> init({required String userId}) async {
    this.userId = userId;
    emit(BandDetailsStateLoading(band));

    try {
      final data = await Future.wait(
        [
          getBandMembersUsecase.call(bandId: band.id),
          getMembershipUseCase.call(userId: userId, bandId: band.id),
        ],
      );
      emit(
        BandDetailsStateLoaded(
          band: band,
          members: data[0] as List<Musician>,
          role: (data[1] as Membership).role,
        ),
      );
    } catch (e) {
      emit(BandDetailsStateError(band));
    }
  }

  bool canDeleteMembership({
    required String membershipMusicianId,
  }) {
    if (membershipMusicianId == userId) {
      return false;
    }
    return (state as BandDetailsStateLoaded).role.permissions.canRemoveMembers;
  }

  Future<void> updateMembers() async {
    final prevState = state as BandDetailsStateLoaded;
    emit(BandDetailsStateLoading(band));
    try {
      final newMembers = await getBandMembersUsecase.call(bandId: band.id);

      emit(
        prevState.copyWith(members: newMembers),
      );
    } catch (e) {
      emit(BandDetailsStateError(band));
    }
  }

  Future<void> deleteBand() async {
    emit(BandDetailsStateLoading(band));
    try {
      await deleteBandUsecase.call(bandId: band.id);
      emit(BandDetailsStateDeleted(band));
    } catch (e) {
      emit(BandDetailsStateError(band));
    }
  }

  Future<void> deleteMembership({required String musicianId}) async {
    final prevState = state as BandDetailsStateLoaded;
    emit(BandDetailsStateLoading(band));
    try {
      await deleteMembershipUsecase.call(musicianId: musicianId, bandId: band.id);
      final newMembers = await getBandMembersUsecase.call(bandId: band.id);

      emit(
        prevState.copyWith(members: newMembers),
      );
    } catch (e) {
      emit(BandDetailsStateError(band));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/entities/musician.dart';
import 'package:setlist/features/band_details/domain/entities/permissions.dart';
import 'package:setlist/features/band_details/domain/usecases/delete_band_usecase.dart';
import 'package:setlist/features/band_details/domain/usecases/delete_membership_usecase.dart';
import 'package:setlist/features/band_details/domain/usecases/get_band_members_usecase.dart';
import 'package:setlist/features/band_details/domain/usecases/get_membership_usecase.dart';
import 'package:setlist/features/band_details/domain/usecases/get_permissions_usecase.dart';
import 'package:setlist/features/band_details/domain/usecases/get_songs_usecase.dart';
import 'package:setlist/features/band_details/domain/usecases/leave_band_usecase.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/features/setlist_editor/domain/usecases/get_setlists_usecase.dart';

import '../../../domain/entities/song.dart';

part 'band_details_state.dart';

class BandDetailsCubit extends Cubit<BandDetailsState> {
  final Band band;
  final GetBandMembersUsecase getBandMembersUsecase;
  final DeleteBandUsecase deleteBandUsecase;
  final DeleteMembershipUsecase deleteMembershipUsecase;
  final GetPermissionsUsecase getPermissionsUsease;
  final GetMembershipUsecase getMembershipUsecase;
  final GetSongsUsecase getSongsUsecase;
  final GetSetlistsUsecase getSetlistsUsecase;
  final LeaveBandUsecase leaveBandUsecase;

  late String userId;

  BandDetailsCubit({
    required this.band,
    required this.getBandMembersUsecase,
    required this.deleteBandUsecase,
    required this.deleteMembershipUsecase,
    required this.getPermissionsUsease,
    required this.getMembershipUsecase,
    required this.getSongsUsecase,
    required this.getSetlistsUsecase,
    required this.leaveBandUsecase,
  }) : super(BandDetailsStateInitial(band));

  Future<void> init({required String userId}) async {
    this.userId = userId;
    emit(BandDetailsStateLoading(band));

    try {
      final data = await Future.wait(
        [
          getBandMembersUsecase.call(bandId: band.id),
          getMembershipUsecase.call(musicianId: userId, bandId: band.id),
          getSongsUsecase.call(bandId: band.id),
          getSetlistsUsecase.call(bandId: band.id),
        ],
      );
      final membership = (data[1] as Membership);
      final permissions = await getPermissionsUsease.call(roleId: membership.roleId);
      emit(
        BandDetailsStateLoaded(
          band: band,
          members: data[0] as List<Musician>,
          permissions: permissions,
          currentMembership: membership,
          songs: data[2] as List<Song>,
          setlists: data[3] as List<Setlist>,
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
    return (state as BandDetailsStateLoaded).permissions.canRemoveMembers;
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

  Future<void> updateSongs() async {
    final prevState = state as BandDetailsStateLoaded;
    emit(BandDetailsStateLoading(band));
    try {
      final newSongs = await getSongsUsecase.call(bandId: band.id);

      emit(
        prevState.copyWith(songs: newSongs),
      );
    } catch (e) {
      emit(BandDetailsStateError(band));
    }
  }

  Future<List<Setlist>?> updateSetlists() async {
    final prevState = state as BandDetailsStateLoaded;
    emit(BandDetailsStateLoading(band));
    try {
      final newSetlists = await getSetlistsUsecase.call(bandId: band.id);

      emit(
        prevState.copyWith(setlists: newSetlists),
      );
      return newSetlists;
    } catch (e) {
      emit(BandDetailsStateError(band));
    }
    return null;
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

  Future<void> leaveBand({required String userId, String? newFounderId}) async {
    emit(BandDetailsStateLoading(band));
    try {
      await leaveBandUsecase.call(
        userId: userId,
        bandId: band.id,
        newFounderId: newFounderId,
      );
      emit(BandDetailsStateDeleted(band));
    } catch (e) {
      emit(BandDetailsStateError(band));
    }
  }

  void removeSetlist({required String setlistId}) {
    final loadedState = state as BandDetailsStateLoaded;
    final newSetlists = loadedState.setlists.where(
      (setlist) => setlist.id != setlistId,
    );

    emit(
      loadedState.copyWith(setlists: newSetlists.toList()),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/core/domain/entities/musician.dart';
import 'package:setlist/features/band_details/usecases/delete_band_usecase.dart';
import 'package:setlist/features/band_details/usecases/get_band_members_usecase.dart';

part 'band_details_state.dart';

class BandDetailsCubit extends Cubit<BandDetailsState> {
  final Band band;
  final GetBandMembersUsecase getBandMembersUsecase;
  final DeleteBandUsecase deleteBandUsecase;

  BandDetailsCubit({
    required this.band,
    required this.getBandMembersUsecase,
    required this.deleteBandUsecase,
  }) : super(BandDetailsStateInitial(band));

  Future<void> init() async {
    emit(BandDetailsStateLoading(band));

    try {
      final members = await getBandMembersUsecase.call(bandId: band.id);

      emit(BandDetailsStateLoaded(band: band, members: members));
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
}

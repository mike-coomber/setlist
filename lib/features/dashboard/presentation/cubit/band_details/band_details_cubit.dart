import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/features/dashboard/domain/entities/band.dart';
import 'package:setlist/features/dashboard/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/domain/usecases/get_band_members_usecase.dart';

part 'band_details_state.dart';

class BandDetailsCubit extends Cubit<BandDetailsState> {
  final Band band;
  final GetBandMembersUsecase getBandMembersUsecase;

  BandDetailsCubit({
    required this.band,
    required this.getBandMembersUsecase,
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
}

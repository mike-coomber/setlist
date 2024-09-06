import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/usecases/get_bands_usecase.dart';
import 'package:setlist/features/dashboard/usecases/get_musician_usecase.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({
    required this.getMusicianUsecase,
    required this.getBandsUsecase,
  }) : super(DashboardInitial());

  final GetMusicianUsecase getMusicianUsecase;
  final GetBandsUsecase getBandsUsecase;

  Future<void> init(String userId) async {
    emit(DashboardLoading());

    try {
      final currentMusician = await getMusicianUsecase.call(userId: userId);
      final bandMemberships = await getBandsUsecase.call(musicianId: userId);

      emit(
        DashboardLoggedIn(
          currentMusician: currentMusician,
          bandMemberships: bandMemberships,
        ),
      );
    } catch (e) {
      emit(DashboardError());
    }
  }

  Future<void> updateBands(String userId) async {
    final prevState = state as DashboardLoggedIn;

    emit(DashboardLoading());
    try {
      final bandMemberships = await getBandsUsecase.call(musicianId: userId);
      emit(prevState.copyWith(bandMemberships: bandMemberships));
    } catch (e) {
      emit(DashboardError());
    }
  }

  Future<void> removeBand({required String bandId}) async {
    if (state is DashboardLoggedIn) {
      final castState = state as DashboardLoggedIn;
      final filteredBands = castState.bandMemberships
          .where(
            (band) => band.bandId != bandId,
          )
          .toList();
      emit(castState.copyWith(bandMemberships: filteredBands));
    }
  }
}

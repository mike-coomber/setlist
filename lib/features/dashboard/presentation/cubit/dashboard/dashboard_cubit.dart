import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/errors.dart';
import 'package:setlist/core/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/usecases/get_bands_usecase.dart';
import 'package:setlist/features/dashboard/usecases/get_musician_usecase.dart';
import 'package:setlist/features/dashboard/usecases/membership_notifier_usecase.dart';

import '../../../../../core/domain/entities/band.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({
    required this.getMusicianUsecase,
    required this.getBandsUsecase,
    required this.membershipNotifierUsecase,
  }) : super(DashboardInitial());

  final GetMusicianUsecase getMusicianUsecase;
  final GetBandsUsecase getBandsUsecase;
  final MembershipNotifierUsecase membershipNotifierUsecase;

  Future<void> init(String userId) async {
    emit(DashboardLoading());

    try {
      final currentMusician = await getMusicianUsecase.call(userId: userId);

      membershipNotifierUsecase.call(userId: userId).listen((memberships) async {
        final bands = await getBandsUsecase.call(memberships: memberships);
        emit(
          DashboardLoggedIn(
            currentMusician: currentMusician,
            bands: bands,
          ),
        );
      });
    } on DataNotFoundError {
      emit(DashboardFirstLogin());
    } catch (e) {
      emit(DashboardError());
    }
  }

  Future<void> removeBand({required String bandId}) async {
    if (state is DashboardLoggedIn) {
      final castState = state as DashboardLoggedIn;
      final filteredBands = castState.bands
          .where(
            (band) => band.id != bandId,
          )
          .toList();
      emit(castState.copyWith(bands: filteredBands));
    }
  }
}

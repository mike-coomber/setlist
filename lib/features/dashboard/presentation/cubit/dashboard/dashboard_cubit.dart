import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/errors.dart';
import 'package:setlist/features/dashboard/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/domain/usecases/get_bands_usecase.dart';
import 'package:setlist/features/dashboard/domain/usecases/get_musician_usecase.dart';

import '../../../domain/entities/band.dart';

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
      final result = await Future.wait([
        getMusicianUsecase.call(userId: userId),
        getBandsUsecase.call(userId: userId),
      ]);
      emit(
        DashboardLoggedIn(
          currentMusician: result[0] as Musician,
          bands: result[1] as List<Band>,
        ),
      );
    } on DataNotFoundError {
      emit(DashboardFirstLogin());
    } catch (e) {
      emit(DashboardError());
    }
  }

  Future<void> getBands() async {
    final prevState = (state as DashboardLoggedIn);
    final id = prevState.currentMusician.id;
    emit(DashboardLoading());

    try {
      final bands = await getBandsUsecase.call(userId: id);
      emit(prevState.copyWith(bands: bands));
    } catch (e) {
      emit(DashboardError());
    }
  }
}

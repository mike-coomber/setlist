import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/errors.dart';
import 'package:setlist/features/dashboard/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/domain/usecases/get_musician_usecase.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({
    required this.getMusicianUsecase,
  }) : super(DashboardInitial());

  final GetMusicianUsecase getMusicianUsecase;

  Future<void> getMusician(String userId) async {
    emit(DashboardLoading());
    try {
      final musician = await getMusicianUsecase.call(userId: userId);
      setMusician(musician);
    } on DataNotFoundError {
      emit(DashboardFirstLogin());
    } catch (e) {
      emit(DashboardError());
    }
  }

  setMusician(Musician musician) {
    emit(DashboardLoggedIn(currentMusician: musician));
  }
}

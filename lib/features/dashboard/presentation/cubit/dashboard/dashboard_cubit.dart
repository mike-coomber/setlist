import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/errors.dart';
import 'package:setlist/features/dashboard/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/domain/usecases/create_musician_usecase.dart';
import 'package:setlist/features/dashboard/domain/usecases/get_musician_usecase.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({
    required this.getMusicianUsecase,
    required this.createMusicianUsecase,
  }) : super(DashboardInitial());

  final GetMusicianUsecase getMusicianUsecase;
  final CreateMusicianUsecase createMusicianUsecase;

  Future<void> getMusician(String userId) async {
    emit(DashboardLoading());
    try {
      final musician = await getMusicianUsecase.call(userId: userId);
      emit(DashboardLoggedIn(currentMusician: musician));
    } on DataNotFoundError {
      emit(DashboardFirstLogin());
    } catch (e) {
      emit(DashboardError());
    }
  }

  Future<void> createMusician(String name) async {}
}

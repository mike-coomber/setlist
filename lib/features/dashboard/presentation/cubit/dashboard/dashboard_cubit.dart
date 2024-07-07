import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/errors.dart';
import 'package:setlist/features/dashboard/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/domain/usecases/get_bands_usecase.dart';
import 'package:setlist/features/dashboard/domain/usecases/get_musician_usecase.dart';
import 'package:setlist/features/dashboard/domain/usecases/membership_notifier_usecase.dart';

import '../../../domain/entities/band.dart';

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
}

part of 'dashboard_cubit.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardError extends DashboardState {}

final class DashboardLoggedIn extends DashboardState {
  final Musician currentMusician;

  const DashboardLoggedIn({required this.currentMusician});

  @override
  List<Object> get props => [currentMusician];
}

final class DashboardFirstLogin extends DashboardState {}

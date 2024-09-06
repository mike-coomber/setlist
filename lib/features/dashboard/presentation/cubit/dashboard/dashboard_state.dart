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
  final List<Membership> bandMemberships;

  const DashboardLoggedIn({
    required this.currentMusician,
    required this.bandMemberships,
  });

  DashboardLoggedIn copyWith({
    Musician? currentMusician,
    List<Membership>? bandMemberships,
  }) {
    return DashboardLoggedIn(
      currentMusician: currentMusician ?? this.currentMusician,
      bandMemberships: bandMemberships ?? this.bandMemberships,
    );
  }

  @override
  List<Object> get props => [currentMusician, bandMemberships];
}

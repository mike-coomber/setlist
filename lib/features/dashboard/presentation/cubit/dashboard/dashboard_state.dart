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
  final List<Band> bands;

  const DashboardLoggedIn({
    required this.currentMusician,
    required this.bands,
  });

  DashboardLoggedIn copyWith({
    Musician? currentMusician,
    List<Band>? bands,
  }) {
    return DashboardLoggedIn(
      currentMusician: currentMusician ?? this.currentMusician,
      bands: bands ?? this.bands,
    );
  }

  @override
  List<Object> get props => [currentMusician, bands];
}

final class DashboardFirstLogin extends DashboardState {}

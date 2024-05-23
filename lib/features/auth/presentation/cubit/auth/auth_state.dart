part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoggedIn extends AuthState {
  final AuthUser user;

  const LoggedIn({required this.user});

  @override
  List<Object> get props => [user];
}

class LoggedOut extends AuthState {}

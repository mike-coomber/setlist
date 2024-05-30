import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/features/auth/domain/entities/auth_user.dart';
import 'package:setlist/features/auth/domain/usecases/logout_usecase.dart';

import '../../../domain/usecases/current_user_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.currentUserUsecase,
    required this.logoutUsecase,
  }) : super(AuthInitial()) {
    subscription = currentUserUsecase.call().listen((currentUser) {
      _currentUser = currentUser;
      if (currentUser == null) {
        emit(LoggedOut());
      } else {
        emit(LoggedIn(user: currentUser));
      }
    });
  }

  final CurrentUserUsecase currentUserUsecase;
  final LogoutUsecase logoutUsecase;
  late final StreamSubscription subscription;

  AuthUser? _currentUser;
  AuthUser get user => _currentUser ?? AuthUser.empty;

  bool get authenticated => _currentUser != null;

  void logout() {
    try {
      logoutUsecase.call();
      emit(LoggedOut());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> close() {
    super.close();
    return subscription.cancel();
  }
}

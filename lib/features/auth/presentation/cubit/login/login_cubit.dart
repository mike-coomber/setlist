import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/features/auth/domain/usecases/login_usecase.dart';

import '../field_status.dart';
import '../form_status.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase usecase;

  LoginCubit({required this.usecase}) : super(const LoginState());

  void onEmailChanged(String val) {
    // TODO: check email validity
    emit(
      state.copyWith(
        email: val,
        emailStatus: FieldStatus.valid,
      ),
    );
  }

  void onPasswordChanged(String val) {
    // TODO: check password validity
    emit(
      state.copyWith(
        password: val,
        passwordStatus: FieldStatus.valid,
      ),
    );
  }

  Future<void> login() async {
    if (!state.formValid) {
      emit(state.copyWith(status: FormStatus.invalid));
      return;
    }

    emit(state.copyWith(status: FormStatus.loading));

    try {
      await usecase.call(email: state.email, password: state.password);
      emit(state.copyWith(status: FormStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
      emit(state.copyWith(status: FormStatus.initial));
    }
  }
}

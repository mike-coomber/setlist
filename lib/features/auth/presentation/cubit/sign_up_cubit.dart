import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/features/auth/domain/usecases/signup_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignupUsecase usecase;

  SignUpCubit({required this.usecase}) : super(const SignUpState());

  void onEmailChanged(String val) {
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

  Future<void> signUp() async {
    if (!state.formValid) {
      emit(state.copyWith(status: SignUpStatus.invalid));
      return;
    }

    emit(state.copyWith(status: SignUpStatus.loading));

    try {
      await usecase.call(email: state.email, password: state.password);
      emit(state.copyWith(status: SignUpStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SignUpStatus.error));
    }
  }
}

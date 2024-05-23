part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final FormStatus status;
  final String email;
  final FieldStatus emailStatus;
  final String password;
  final FieldStatus passwordStatus;

  bool get formValid => emailStatus == FieldStatus.valid && passwordStatus == FieldStatus.valid;

  const SignUpState({
    this.status = FormStatus.initial,
    this.email = '',
    this.emailStatus = FieldStatus.initilal,
    this.password = '',
    this.passwordStatus = FieldStatus.initilal,
  });

  SignUpState copyWith({
    FormStatus? status,
    String? email,
    FieldStatus? emailStatus,
    String? password,
    FieldStatus? passwordStatus,
  }) {
    return SignUpState(
      status: status ?? this.status,
      email: email ?? this.email,
      emailStatus: emailStatus ?? this.emailStatus,
      password: password ?? this.password,
      passwordStatus: passwordStatus ?? this.passwordStatus,
    );
  }

  @override
  List<Object> get props => [status, email, emailStatus, password, passwordStatus];
}

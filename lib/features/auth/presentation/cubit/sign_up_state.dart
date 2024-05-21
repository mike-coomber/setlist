part of 'sign_up_cubit.dart';

enum SignUpStatus {
  initial,
  loading,
  error,
  valid,
  invalid,
  success,
}

enum FieldStatus {
  initilal,
  valid,
  invalid,
}

class SignUpState extends Equatable {
  final SignUpStatus status;
  final String email;
  final FieldStatus emailStatus;
  final String password;
  final FieldStatus passwordStatus;

  bool get formValid => emailStatus == FieldStatus.valid && passwordStatus == FieldStatus.valid;

  const SignUpState({
    this.status = SignUpStatus.initial,
    this.email = '',
    this.emailStatus = FieldStatus.initilal,
    this.password = '',
    this.passwordStatus = FieldStatus.initilal,
  });

  SignUpState copyWith({
    SignUpStatus? status,
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
  List<Object> get props => [];
}

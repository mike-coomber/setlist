part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final FormStatus status;
  final String email;
  final FieldStatus emailStatus;
  final String password;
  final FieldStatus passwordStatus;
  final String name;
  final FieldStatus nameStatus;

  bool get formValid =>
      emailStatus == FieldStatus.valid && passwordStatus == FieldStatus.valid && nameStatus == FieldStatus.valid;

  const SignUpState({
    this.status = FormStatus.initial,
    this.email = '',
    this.emailStatus = FieldStatus.initilal,
    this.password = '',
    this.passwordStatus = FieldStatus.initilal,
    this.name = '',
    this.nameStatus = FieldStatus.initilal,
  });

  SignUpState copyWith({
    FormStatus? status,
    String? email,
    FieldStatus? emailStatus,
    String? password,
    FieldStatus? passwordStatus,
    String? name,
    FieldStatus? nameStatus,
  }) {
    return SignUpState(
      status: status ?? this.status,
      email: email ?? this.email,
      emailStatus: emailStatus ?? this.emailStatus,
      password: password ?? this.password,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      name: name ?? this.name,
      nameStatus: nameStatus ?? this.nameStatus,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        emailStatus,
        password,
        passwordStatus,
        name,
        nameStatus,
      ];
}

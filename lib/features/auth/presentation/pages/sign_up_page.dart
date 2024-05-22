import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/auth/domain/usecases/signup_usecase.dart';
import 'package:setlist/features/auth/presentation/cubit/sign_up_cubit.dart';

import '../../domain/repositories/auth_repository.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        usecase: SignupUsecase(
          authRepository: context.read<AuthRepository>(),
        ),
      ),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.status == SignUpStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Signup failed')),
            );
          }
          if (state.status == SignUpStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Signup success')),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Email'),
                  onChanged: context.read<SignUpCubit>().onEmailChanged,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Password'),
                  onChanged: context.read<SignUpCubit>().onPasswordChanged,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                FilledButton(
                  onPressed: context.read<SignUpCubit>().signUp,
                  child: Text('Sign up'),
                ),
                if (state.status == SignUpStatus.loading) const CircularProgressIndicator()
              ],
            ),
          );
        },
      ),
    );
  }
}

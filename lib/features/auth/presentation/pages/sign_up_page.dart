import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:setlist/injection_container.dart';

import '../cubit/form_status.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => serviceLocator<SignUpCubit>(),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpCubit get _cubit => context.read<SignUpCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.status == FormStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Signup failed')),
            );
          }
          if (state.status == FormStatus.success) {
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
                  decoration: const InputDecoration(hintText: 'Email'),
                  onChanged: _cubit.onEmailChanged,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Password'),
                  onChanged: _cubit.onPasswordChanged,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                FilledButton(
                  onPressed: _cubit.signUp,
                  child: const Text('Sign up'),
                ),
                if (state.status == FormStatus.loading) const CircularProgressIndicator()
              ],
            ),
          );
        },
      ),
    );
  }
}

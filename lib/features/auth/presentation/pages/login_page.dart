import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:setlist/injection_container.dart';
import 'package:setlist/router/router.gr.dart';

import '../cubit/form_status.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => serviceLocator<LoginCubit>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginCubit get _cubit => context.read<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == FormStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login failed')),
            );
          }
          if (state.status == FormStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login success')),
            );
            context.router.removeLast();
            context.router.push(const HomeRoute());
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
                  onPressed: () => context.router.push(const SignUpRoute()),
                  child: const Text('Sign up'),
                ),
                FilledButton(
                  onPressed: _cubit.login,
                  child: const Text('Login'),
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

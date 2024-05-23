import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:setlist/router/router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          // if (state == LoggedOut()) context.router.push(constLoggedOutRoute());
        },
        child: Scaffold(
          body: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Logged in as ${context.read<AuthCubit>().user.email}'),
              BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                return FilledButton(
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                    context.router.push(const LoginRoute());
                  },
                  child: const Text('Logout'),
                );
              })
            ],
          )),
        ),
      ),
    );
  }
}

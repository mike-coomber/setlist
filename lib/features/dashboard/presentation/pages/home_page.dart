import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:setlist/features/dashboard/presentation/cubit/dashboard/dashboard_cubit.dart';
import 'package:setlist/features/dashboard/presentation/views/error.dart';
import 'package:setlist/features/dashboard/presentation/views/first_login_view.dart';
import 'package:setlist/features/dashboard/presentation/views/loading_view.dart';
import 'package:setlist/features/dashboard/presentation/views/logged_in_view.dart';
import 'package:setlist/injection_container.dart';
import 'package:setlist/router/router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setlist'),
        actions: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context.read<AuthCubit>().logout();
                  context.router.push(const LoginRoute());
                },
                icon: Icon(Icons.logout),
              );
            },
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => serviceLocator<DashboardCubit>()
          ..getMusician(
            context.read<AuthCubit>().user.id,
          ),
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            switch (state) {
              case DashboardInitial():
              case DashboardLoading():
                return const LoadingView();
              case DashboardError():
                return const ErrorView();
              case DashboardLoggedIn():
                return const LoggedInView();
              case DashboardFirstLogin():
                return const FirstLoginView();
            }
          },
        ),
      ),
    );
  }
}

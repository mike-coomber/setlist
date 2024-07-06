import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:setlist/features/dashboard/presentation/cubit/dashboard/dashboard_cubit.dart';
import 'package:setlist/features/dashboard/presentation/views/create_band_view.dart';
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
    return BlocProvider(
      create: (context) => serviceLocator<DashboardCubit>()
        ..init(
          context.read<AuthCubit>().user.id,
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('setlist'),
          actions: [
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (context) {
                        return CreateBandView();
                      },
                    );
                    if (result == true && context.mounted) {
                      context.read<DashboardCubit>().getBands();
                    }
                  },
                  icon: const Icon(Icons.add),
                );
              },
            ),
            IconButton(
              onPressed: () async {
                await context.read<AuthCubit>().logout();
                if (!context.mounted) return;
                context.pushRoute(const LoginRoute());
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: BlocBuilder<DashboardCubit, DashboardState>(
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

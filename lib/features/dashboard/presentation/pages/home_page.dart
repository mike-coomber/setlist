import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:setlist/features/dashboard/presentation/cubit/dashboard/dashboard_cubit.dart';
import 'package:setlist/core/presentation/error_view.dart';
import 'package:setlist/core/presentation/loading_view.dart';
import 'package:setlist/features/dashboard/presentation/views/band_list_view.dart';
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
          title: const Text('setlist'),
          actions: [
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () async {
                    if (state is DashboardLoggedIn) {
                      final bandCreated = await context.pushRoute(
                        CreateBandRoute(musician: state.currentMusician),
                      );
                      if (bandCreated == true && context.mounted) {
                        context.read<DashboardCubit>().updateBands(
                              state.currentMusician.id,
                            );
                      }
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
                return const BandMembershipsListView();
            }
          },
        ),
      ),
    );
  }
}

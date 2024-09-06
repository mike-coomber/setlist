import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/dashboard/presentation/cubit/dashboard/dashboard_cubit.dart';
import 'package:setlist/router/router.gr.dart';

class BandMembershipsListView extends StatelessWidget {
  const BandMembershipsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        final loggedInState = state as DashboardLoggedIn;

        return Column(
          children: [
            Text(loggedInState.currentMusician.name),
            if (state.bandMemberships.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: state.bandMemberships.length,
                  itemBuilder: (context, index) {
                    final membership = state.bandMemberships[index];
                    return GestureDetector(
                      onTap: () async {
                        final bandId = await context.pushRoute(BandDetailsRoute(
                          bandId: membership.bandId,
                          children: [
                            BandDashboardRoute(bandId: membership.bandId),
                          ],
                        ));
                        if (context.mounted && bandId != null && bandId is String) {
                          context.read<DashboardCubit>().removeBand(bandId: bandId);
                        }
                      },
                      child: Card(
                        child: Text(membership.bandName),
                      ),
                    );
                  },
                ),
              )
            else
              const Text('No Results'),
          ],
        );
      },
    );
  }
}

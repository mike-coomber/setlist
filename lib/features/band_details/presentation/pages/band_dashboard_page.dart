import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/core/presentation/error_view.dart';
import 'package:setlist/core/presentation/loading_view.dart';
import 'package:setlist/features/band_details/presentation/cubit/band_details/band_details_cubit.dart';
import 'package:setlist/features/band_details/presentation/views/setlist_list_view.dart';
import 'package:setlist/features/band_details/presentation/views/song_list_view.dart';
import 'package:setlist/router/router.gr.dart';

@RoutePage()
class BandDashboardPage extends StatelessWidget {
  final Band band;

  const BandDashboardPage({required this.band, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BandDetailsCubit, BandDetailsState>(
      builder: (context, state) {
        final List<Widget> actions = [];

        if (state is BandDetailsStateLoaded) {
          if (state.permissions.canAddMembers) {
            actions.add(
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => context.pushRoute(const AddMembersRoute()),
              ),
            );
          }
          if (state.permissions.canDeleteBand) {
            actions.add(
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<BandDetailsCubit>().deleteBand();
                },
              ),
            );
          }
        }

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(band.name),
              actions: actions,
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Setlists'),
                  Tab(text: 'Songs'),
                ],
              ),
            ),
            body: Builder(
              builder: (context) {
                switch (state) {
                  case BandDetailsStateInitial():
                  case BandDetailsStateLoading():
                    return const LoadingView();
                  case BandDetailsStateError():
                  case BandDetailsStateDeleted():
                    return const ErrorView();
                  case BandDetailsStateLoaded():
                    return Column(
                      children: [
                        Expanded(
                          child: TabBarView(
                            children: [
                              const SetlistListView(),
                              SongListView(songs: state.songs),
                            ],
                          ),
                        ),
                      ],
                    );
                }
              },
            ),
          ),
        );
      },
    );
  }
}

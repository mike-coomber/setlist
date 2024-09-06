import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/core/presentation/error_view.dart';
import 'package:setlist/core/presentation/loading_view.dart';
import 'package:setlist/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:setlist/features/band_details/presentation/components/leave_band_modal.dart';
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
        final List<PopupMenuItem> actions = [];

        if (state is BandDetailsStateLoaded) {
          if (state.permissions.canAddMembers) {
            actions.add(
              PopupMenuItem(
                child: const Text('Add members'),
                onTap: () => context.pushRoute(const AddMembersRoute()),
              ),
            );
          }
          if (state.permissions.canDeleteBand) {
            actions.add(
              PopupMenuItem(
                child: Text('Delete band'),
                onTap: () => context.read<BandDetailsCubit>().deleteBand(),
              ),
            );
          }
          actions.add(
            PopupMenuItem(
                child: Text('Leave band'),
                onTap: () async {
                  final result = await showDialog<LeaveBandModalResult>(
                    context: context,
                    builder: (context) => LeaveBandModal(
                      musicians: state.members,
                      bandId: state.band.id,
                      roleId: state.currentMembership.roleId,
                    ),
                  );
                  if (!context.mounted) return;
                  if (result != null && result.leaveBand) {
                    final userId = context.read<AuthCubit>().user.id;
                    context.read<BandDetailsCubit>().leaveBand(
                          userId: userId,
                          newFounderId: result.newFounderId,
                        );
                  }
                }),
          );
        }

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(band.name),
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => actions,
                  position: PopupMenuPosition.under,
                ),
              ],
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
                              SetlistListView(
                                setlists: state.setlists,
                                band: band,
                              ),
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

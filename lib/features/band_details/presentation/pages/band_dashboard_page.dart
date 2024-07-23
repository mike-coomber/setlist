import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/core/presentation/error_view.dart';
import 'package:setlist/core/presentation/loading_view.dart';
import 'package:setlist/features/band_details/presentation/cubit/band_details/band_details_cubit.dart';
import 'package:setlist/router/router.gr.dart';

@RoutePage()
class BandDashboardPage extends StatelessWidget {
  final Band band;

  const BandDashboardPage({required this.band, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BandDetailsCubit, BandDetailsState>(builder: (context, state) {
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
        actions.add(
          IconButton(
            icon: const Icon(Icons.music_note),
            onPressed: () {
              context.pushRoute(SongListRoute(band: band));
            },
          ),
        );
      }

      return Scaffold(
        appBar: AppBar(
          title: Text(band.name),
          actions: actions,
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
                return ListView.builder(
                  itemCount: state.members.length,
                  itemBuilder: (context, index) {
                    final member = state.members[index];
                    final canDeleteMembership = context.read<BandDetailsCubit>().canDeleteMembership(
                          membershipMusicianId: member.id,
                        );

                    return ListTile(
                      title: Text(member.name),
                      trailing: canDeleteMembership
                          ? IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                context.read<BandDetailsCubit>().deleteMembership(musicianId: member.id);
                              },
                            )
                          : null,
                    );
                  },
                );
            }
          },
        ),
      );
    });
  }
}

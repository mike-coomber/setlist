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
    return Scaffold(
      appBar: AppBar(
        title: Text(band.name),
        actions: [
          IconButton(
            onPressed: () async {
              await context.pushRoute(const AddMembersRoute());
              if (!context.mounted) return;
              context.read<BandDetailsCubit>().updateMembers();
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: context.read<BandDetailsCubit>().deleteBand,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: BlocBuilder<BandDetailsCubit, BandDetailsState>(
        builder: (context, state) {
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
  }
}

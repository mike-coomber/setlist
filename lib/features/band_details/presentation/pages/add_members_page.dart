import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/band_details/presentation/cubit/add_members/add_members_cubit.dart';
import 'package:setlist/features/band_details/presentation/cubit/band_details/band_details_cubit.dart';
import 'package:setlist/injection_container.dart';

import '../../../auth/presentation/cubit/form_status.dart';

@RoutePage()
class AddMembersPage extends StatelessWidget {
  const AddMembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddMembersCubit>(
      create: (context) {
        final bandDeatilsState = (context.read<BandDetailsCubit>().state as BandDetailsStateLoaded);
        final currentMemberMusicianIds = bandDeatilsState.members.map((musician) => musician.id).toList();

        return serviceLocator<AddMembersCubit>(param1: currentMemberMusicianIds);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add members'),
        ),
        body: BlocListener<AddMembersCubit, AddMembersState>(
          listener: (context, state) {
            if (state.searchStatus == FormStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error searching members')),
              );
            }
            if (state.submitStatus == FormStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error adding members')),
              );
            } else if (state.submitStatus == FormStatus.success) {
              context.maybePop();
            }
          },
          child: BlocBuilder<AddMembersCubit, AddMembersState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    children: [
                      TextField(
                        onChanged: context.read<AddMembersCubit>().onSearchChanged,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.searchResults.length,
                          itemBuilder: (context, index) {
                            final musician = state.searchResults[index];

                            return ListTile(
                              onTap: () => context.read<AddMembersCubit>().onMusicianSelected(
                                    musicianId: musician.id,
                                  ),
                              title: Text(musician.name),
                              selected: state.selectedMusicianIds.contains(musician.id),
                            );
                          },
                        ),
                      ),
                      FilledButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          final bandId = context.read<BandDetailsCubit>().band.id;

                          context.read<AddMembersCubit>().addMembers(bandId: bandId);
                        },
                      )
                    ],
                  ),
                  if (state.searchStatus == FormStatus.loading) const LinearProgressIndicator()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

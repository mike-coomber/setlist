import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/band_details/presentation/cubit/add_members/add_members_cubit.dart';
import 'package:setlist/injection_container.dart';

import '../../../auth/presentation/cubit/form_status.dart';

@RoutePage()
class AddMembersPage extends StatelessWidget {
  const AddMembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddMembersCubit>(
      create: (context) => serviceLocator(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add members'),
        ),
        body: BlocBuilder<AddMembersCubit, AddMembersState>(
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

                            return Card(child: Text(musician.name));
                          }),
                    ),
                  ],
                ),
                if (state.status == FormStatus.loading) const LinearProgressIndicator()
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/band_details/presentation/cubit/band_details/band_details_cubit.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/router/router.gr.dart';

@RoutePage(name: 'SetlistTab')
class SetlistListView extends StatelessWidget {
  final List<Setlist> setlists;

  const SetlistListView({required this.setlists, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          onPressed: () {
            context.pushRoute(
              SetlistEditorRoute(
                band: context.read<BandDetailsCubit>().state.band,
              ),
            );
          },
          child: Text('New setlist'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: setlists.length,
            itemBuilder: (context, index) {
              final setlist = setlists[index];
              return ListTile(
                title: Text(setlist.name),
                onTap: () {
                  context.pushRoute(
                    SetlistEditorRoute(
                      band: context.read<BandDetailsCubit>().state.band,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

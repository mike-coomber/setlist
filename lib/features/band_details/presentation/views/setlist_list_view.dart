import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/band_details/presentation/cubit/band_details/band_details_cubit.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/router/router.gr.dart';

import '../../../../core/domain/entities/band.dart';

@RoutePage(name: 'SetlistTab')
class SetlistListView extends StatelessWidget {
  final List<Setlist> setlists;
  final Band band;

  const SetlistListView({
    required this.setlists,
    required this.band,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final permissions = (context.read<BandDetailsCubit>().state as BandDetailsStateLoaded).permissions;

    return Column(
      children: [
        if (permissions.canModifySetlists)
          FilledButton(
            onPressed: () async {
              final setlistAdded = await context.pushRoute(
                SetlistEditorRoute(
                  band: (context.read<BandDetailsCubit>().state as BandDetailsStateLoaded).band,
                ),
              );
              if (setlistAdded == true && context.mounted) {
                context.read<BandDetailsCubit>().updateSetlists();
              }
            },
            child: const Text('New setlist'),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: setlists.length,
            itemBuilder: (context, index) {
              final setlist = setlists[index];
              return ListTile(
                title: Text(setlist.name),
                onTap: () async {
                  final setlistDeleted = await context.pushRoute(
                    SetlistRoute(
                      setlist: setlist,
                      band: (context.read<BandDetailsCubit>().state as BandDetailsStateLoaded).band,
                    ),
                  );
                  if (setlistDeleted == true && context.mounted) {
                    context.read<BandDetailsCubit>().removeSetlist(
                          setlistId: setlist.id,
                        );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

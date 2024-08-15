import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/band_details/presentation/cubit/band_details/band_details_cubit.dart';
import 'package:setlist/features/band_details/presentation/cubit/setlist_view/setlist_view_cubit.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/injection_container.dart';
import 'package:setlist/router/router.gr.dart';

import '../../../../core/domain/entities/band.dart';

@RoutePage()
class SetlistPage extends StatelessWidget {
  final Setlist setlist;
  final Band band;

  const SetlistPage({
    required this.setlist,
    required this.band,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetlistViewCubit>(
      create: (context) => serviceLocator<SetlistViewCubit>(
        param1: setlist,
        param2: band.id,
      ),
      child: BlocBuilder<SetlistViewCubit, SetlistViewState>(
        builder: (context, state) {
          final permissions = (context.read<BandDetailsCubit>().state as BandDetailsStateLoaded).permissions;
          return BlocListener<SetlistViewCubit, SetlistViewState>(
            listener: (context, state) {
              if (state is SetlistViewDeleted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Setlist deleted')));
                context.maybePop(true);
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(state.setlist.name),
                actions: [
                  if (permissions.canModifySetlists)
                    IconButton(
                      onPressed: () async {
                        final updateSetlist = await context.pushRoute(
                          SetlistEditorRoute(band: band, setlist: state.setlist),
                        );
                        if (updateSetlist == true && context.mounted) {
                          final newSetlists = await context.read<BandDetailsCubit>().updateSetlists();
                          if (!context.mounted) return;
                          context.read<SetlistViewCubit>().findAndUpdateSetlist(newSetlists);
                        }
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  if (permissions.canModifySetlists)
                    IconButton(
                      onPressed: context.read<SetlistViewCubit>().deleteSetlist,
                      icon: const Icon(Icons.delete),
                    ),
                ],
              ),
              body: Builder(
                builder: (context) {
                  if (state is SetlistViewLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: setlist.events.length,
                    itemBuilder: (context, index) {
                      final setlistEvent = state.setlist.events[index];

                      return ListTile(
                        leading: Text('${setlistEvent.order}.'),
                        title: Text(setlistEvent.name),
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

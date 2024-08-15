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
    super.key,
    required this.setlist,
    required this.band,
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
          return PopScope(
            onPopInvoked: (_) {
              if (state is SetlistViewDeleted || (state is SetlistViewInitial && state.setlistUpdated)) {
                context.maybePop(true);
              } else {
                context.maybePop();
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(state.setlist.name),
                actions: [
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
                  )
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

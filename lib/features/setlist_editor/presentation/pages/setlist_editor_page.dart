import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/features/band_details/presentation/views/song_list_view.dart';
import 'package:setlist/features/setlist_editor/presentation/cubit/setlist_editor_cubit.dart';
import 'package:setlist/injection_container.dart';

@RoutePage()
class SetlistEditorPage extends StatelessWidget {
  final Band band;

  const SetlistEditorPage({required this.band, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetlistEditorCubit>(
      create: (context) => serviceLocator<SetlistEditorCubit>(param1: band)..loadSongs(),
      child: Scaffold(
        appBar: AppBar(title: Text('New setlist')),
        body: BlocBuilder<SetlistEditorCubit, SetlistEditorState>(
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  onChanged: context.read<SetlistEditorCubit>().setlistNameChanged,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                BlocBuilder<SetlistEditorCubit, SetlistEditorState>(
                  builder: (context, state) {
                    return ReorderableListView.builder(
                      itemCount: state.events.length,
                      shrinkWrap: true,
                      onReorder: context.read<SetlistEditorCubit>().reorderEvents,
                      itemBuilder: (context, index) {
                        final event = state.events[index];
                        return ListTile(
                          key: ValueKey(index),
                          title: Text(event.name),
                        );
                      },
                    );
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.music_note),
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (sheetContext) => SongListView(
                          songs: state.songs,
                          onSongSelected: (song) {
                            context.read<SetlistEditorCubit>().addSongEvent(song);
                            sheetContext.maybePop();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Event name'),
                        onChanged: context.read<SetlistEditorCubit>().eventNameChanged,
                        onSubmitted: (_) => context.read<SetlistEditorCubit>().addEvent(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => context.read<SetlistEditorCubit>().addEvent(),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

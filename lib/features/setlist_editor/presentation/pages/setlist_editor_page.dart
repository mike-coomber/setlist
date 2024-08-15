import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/features/auth/presentation/cubit/form_status.dart';
import 'package:setlist/features/band_details/presentation/views/song_list_view.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/features/setlist_editor/presentation/cubit/setlist_editor_cubit.dart';
import 'package:setlist/injection_container.dart';

@RoutePage()
class SetlistEditorPage extends StatefulWidget {
  final Band band;
  final Setlist? setlist;

  const SetlistEditorPage({
    required this.band,
    this.setlist,
    super.key,
  });

  @override
  State<SetlistEditorPage> createState() => _SetlistEditorPageState();
}

class _SetlistEditorPageState extends State<SetlistEditorPage> {
  final eventNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetlistEditorCubit>(
      create: (context) => serviceLocator<SetlistEditorCubit>(
        param1: widget.band,
        param2: widget.setlist,
      )..loadSongs(),
      child: Scaffold(
        appBar: AppBar(title: Text(widget.setlist?.name ?? 'New setlist')),
        body: BlocListener<SetlistEditorCubit, SetlistEditorState>(
          listener: (context, state) {
            if (state.status == FormStatus.success) {
              context.maybePop(true);
            }
            if (state.status == FormStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
            }
          },
          child: BlocBuilder<SetlistEditorCubit, SetlistEditorState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TextFormField(
                        onChanged: context.read<SetlistEditorCubit>().setlistNameChanged,
                        decoration: const InputDecoration(labelText: 'Name'),
                        initialValue: state.name,
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
                            icon: const Icon(Icons.music_note),
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
                              controller: eventNameController,
                              decoration: const InputDecoration(labelText: 'Event name'),
                              onChanged: context.read<SetlistEditorCubit>().eventNameChanged,
                              onSubmitted: (_) {
                                context.read<SetlistEditorCubit>().addEvent();
                                eventNameController.clear();
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => context.read<SetlistEditorCubit>().addEvent(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await context.read<SetlistEditorCubit>().addSetList();
                    },
                    child: const Text('Save'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

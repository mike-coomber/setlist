import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/features/auth/presentation/cubit/form_status.dart';
import 'package:setlist/features/band_details/presentation/views/song_list_view.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist_event.dart';
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: context.read<SetlistEditorCubit>().setlistNameChanged,
                          decoration: const InputDecoration(labelText: 'Name'),
                          initialValue: state.name,
                        ),
                      ),
                      ReorderableListView.builder(
                        itemCount: state.events.length,
                        shrinkWrap: true,
                        onReorder: context.read<SetlistEditorCubit>().reorderEvents,
                        itemBuilder: (context, index) {
                          final event = state.events[index];
                          return SetlistEventTile(
                            event: event,
                            key: ValueKey(index),
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

class SetlistEventTile extends StatefulWidget {
  const SetlistEventTile({required this.event, super.key});

  final SetlistEvent event;

  @override
  State<SetlistEventTile> createState() => _SetlistEventTileState();
}

class _SetlistEventTileState extends State<SetlistEventTile> {
  final TextEditingController notesController = TextEditingController();
  bool addingNotes = false;

  @override
  void initState() {
    super.initState();
    notesController.text = widget.event.notes;
  }

  @override
  void didUpdateWidget(covariant SetlistEventTile oldWidget) {
    notesController.text = widget.event.notes;

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("${widget.event.order}. ${widget.event.name}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.note_add),
                onPressed: () => setState(() {
                  addingNotes = true;
                }),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => context.read<SetlistEditorCubit>().removeEvent(widget.event),
              ),
            ],
          ),
        ),
        if (addingNotes || widget.event.notes.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
              onChanged: (value) => context.read<SetlistEditorCubit>().onEventNotesChanged(
                    value,
                    widget.event,
                  ),
              onSubmitted: (_) {
                setState(() {
                  addingNotes = false;
                });
              },
            ),
          ),
      ],
    );
  }
}

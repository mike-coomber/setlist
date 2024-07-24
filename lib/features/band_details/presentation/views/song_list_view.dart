import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/band_details/presentation/cubit/band_details/band_details_cubit.dart';
import 'package:setlist/features/band_details/presentation/views/add_song_view.dart';

import '../../domain/entities/song.dart';

@RoutePage(name: 'SongTab')
class SongListView extends StatelessWidget {
  final List<Song> songs;

  const SongListView({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final bool songAdded = await showModalBottomSheet(
                context: context,
                builder: (context) => AddSongView(
                      band: context.read<BandDetailsCubit>().band,
                    ));
            if (songAdded == true && context.mounted) {
              context.read<BandDetailsCubit>().updateSongs();
            }
          },
          child: Text('Add Song'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return ListTile(
                title: Text(song.name),
                subtitle: Text(song.artist),
              );
            },
          ),
        ),
      ],
    );
  }
}

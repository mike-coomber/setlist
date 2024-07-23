import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/core/presentation/error_view.dart';
import 'package:setlist/core/presentation/loading_view.dart';
import 'package:setlist/features/songs/presentation/cubit/song_list_cubit.dart';
import 'package:setlist/injection_container.dart';

@RoutePage()
class SongListPage extends StatelessWidget {
  final Band band;
  const SongListPage({required this.band, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SongListCubit>(
      create: (context) => serviceLocator<SongListCubit>(param1: band)..init(),
      child: Scaffold(
        appBar: AppBar(title: Text(band.name)),
        body: BlocBuilder<SongListCubit, SongListState>(
          builder: (context, state) {
            switch (state) {
              case SongListInitial():
                return const LoadingView();
              case SongListLoading():
                return const LoadingView();
              case SongListError():
                return const ErrorView();
              case SongListLoaded():
                return ListView.builder(
                  itemCount: state.songs.length,
                  itemBuilder: (context, index) {
                    final song = state.songs[index];
                    return ListTile(
                      title: Text(song.name),
                      subtitle: Text(song.artist),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

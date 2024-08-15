import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/features/band_details/presentation/cubit/add_song/add_song_cubit.dart';
import 'package:setlist/injection_container.dart';

import '../../../auth/presentation/cubit/form_status.dart';

class AddSongView extends StatelessWidget {
  const AddSongView({required this.band, super.key});

  final Band band;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddSongCubit>(
      create: (context) => serviceLocator<AddSongCubit>(param1: band),
      child: BlocListener<AddSongCubit, AddSongState>(
        listener: (context, state) {
          if (state.formStatus == FormStatus.success) {
            context.maybePop(true);
          } else if (state.formStatus == FormStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to add song'),
              ),
            );
          }
        },
        child: BlocBuilder<AddSongCubit, AddSongState>(
          builder: (context, state) {
            return Column(
              children: [
                if (state.formStatus == FormStatus.loading) const LinearProgressIndicator(),
                TextField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  onChanged: context.read<AddSongCubit>().titleChanged,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Artist'),
                  onChanged: context.read<AddSongCubit>().artistChanged,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Duration'),
                  onChanged: (val) => context.read<AddSongCubit>().durationChanged(int.parse(val)),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: context.read<AddSongCubit>().submit,
                  child: const Text('Add Song'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

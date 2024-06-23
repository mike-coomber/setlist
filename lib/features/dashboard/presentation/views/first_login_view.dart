import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:setlist/features/auth/presentation/cubit/form_status.dart';
import 'package:setlist/features/dashboard/presentation/cubit/create_musician/create_musician_cubit.dart';
import 'package:setlist/features/dashboard/presentation/cubit/dashboard/dashboard_cubit.dart';
import 'package:setlist/injection_container.dart';

class FirstLoginView extends StatelessWidget {
  const FirstLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<CreateMusicianCubit>(),
      child: BlocListener<CreateMusicianCubit, CreateMusicianState>(
        listener: (context, state) {
          switch (state) {
            case CreateMusicianStateForm():
              if (state.status == FormStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Create musician failed')),
                );
              }
              break;
            case CreateMusicianStateSuccessful():
              context.read<DashboardCubit>().setMusician(state.createdMusician);
              break;
          }
        },
        child: BlocBuilder<CreateMusicianCubit, CreateMusicianState>(
          builder: (context, state) {
            switch (state) {
              case CreateMusicianStateForm():
                return Center(
                  child: Column(
                    children: [
                      Text('First login'),
                      TextField(
                        onSubmitted: (_) => context.read<CreateMusicianCubit>().createMusician(
                              context.read<AuthCubit>().user.id,
                            ),
                        onChanged: context.read<CreateMusicianCubit>().onNameChanged,
                      ),
                      if (state.status == FormStatus.loading) const CircularProgressIndicator(),
                    ],
                  ),
                );
              case CreateMusicianStateSuccessful():
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

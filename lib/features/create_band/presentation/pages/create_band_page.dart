import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:setlist/features/auth/presentation/cubit/form_status.dart';
import 'package:setlist/features/create_band/presentation/cubit/create_band_cubit.dart';
import 'package:setlist/injection_container.dart';

@RoutePage()
class CreateBandPage extends StatelessWidget {
  const CreateBandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateBandCubit>(
      create: (context) => serviceLocator(),
      child: BlocListener<CreateBandCubit, CreateBandState>(
        listener: (context, state) {
          if (state.status == FormStatus.success) {
            context.maybePop(true);
          }
        },
        child: BlocBuilder<CreateBandCubit, CreateBandState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(title: Text('Create new band')),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(hintText: 'Band name'),
                      onChanged: context.read<CreateBandCubit>().onNameChanged,
                    ),
                    FilledButton(
                      onPressed: () {
                        final userId = context.read<AuthCubit>().user.id;
                        context.read<CreateBandCubit>().createBand(userId: userId);
                      },
                      child: const Text('Create band'),
                    ),
                    if (state.status == FormStatus.loading) const LinearProgressIndicator(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

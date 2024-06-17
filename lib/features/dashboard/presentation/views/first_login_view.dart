import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/dashboard/presentation/cubit/dashboard/dashboard_cubit.dart';

class FirstLoginView extends StatelessWidget {
  const FirstLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('First login'),
          TextField(
            onSubmitted: (value) => context.read<DashboardCubit>(),
          )
        ],
      ),
    );
  }
}

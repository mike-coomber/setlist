import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/dashboard/presentation/cubit/dashboard/dashboard_cubit.dart';

class LoggedInView extends StatelessWidget {
  const LoggedInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        final loggedInState = state as DashboardLoggedIn;

        return Center(
          child: Text(loggedInState.currentMusician.name),
        );
      },
    );
  }
}

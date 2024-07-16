import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/features/band_details/presentation/cubit/band_details/band_details_cubit.dart';
import 'package:setlist/injection_container.dart';

@RoutePage()
class BandDetailsPage extends StatelessWidget {
  final Band band;

  const BandDetailsPage({required this.band, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BandDetailsCubit>(
      create: (context) => serviceLocator<BandDetailsCubit>(param1: band)..init(),
      child: BlocListener<BandDetailsCubit, BandDetailsState>(
        listener: (context, state) {
          if (state is BandDetailsStateDeleted) {
            context.maybePop(state.band.id);
          }
        },
        child: const AutoRouter(),
      ),
    );
  }
}

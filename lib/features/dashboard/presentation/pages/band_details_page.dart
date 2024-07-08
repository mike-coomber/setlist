import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/dashboard/domain/entities/band.dart';
import 'package:setlist/features/dashboard/presentation/cubit/band_details/band_details_cubit.dart';
import 'package:setlist/features/dashboard/presentation/views/error.dart';
import 'package:setlist/features/dashboard/presentation/views/loading_view.dart';
import 'package:setlist/injection_container.dart';

@RoutePage()
class BandDetailsPage extends StatelessWidget {
  final Band band;

  const BandDetailsPage({required this.band, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BandDetailsCubit>(
      create: (context) => BandDetailsCubit(
        band: band,
        getBandMembersUsecase: serviceLocator(),
      )..init(),
      child: Scaffold(
        appBar: AppBar(title: Text(band.name)),
        body: BlocBuilder<BandDetailsCubit, BandDetailsState>(
          builder: (context, state) {
            switch (state) {
              case BandDetailsStateInitial():
              case BandDetailsStateLoading():
                return const LoadingView();
              case BandDetailsStateError():
                return const ErrorView();
              case BandDetailsStateLoaded():
                return ListView.builder(
                  itemCount: state.members.length,
                  itemBuilder: (context, index) {
                    final member = state.members[index];

                    return Card(
                      child: Text(member.name),
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

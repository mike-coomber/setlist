import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'SetlistTab')
class SetlistListView extends StatelessWidget {
  const SetlistListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Setlist list view'),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/domain/entities/musician.dart';
import '../../../setlist_editor/domain/entities/setlist.dart';

class BandDetailsView extends StatelessWidget {
  const BandDetailsView({
    required this.setlists,
    required this.members,
    required this.bandName,
    Key? key,
  }) : super(key: key);

  final String bandName;
  final List<Setlist> setlists;
  final List<Musician> members;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }
}

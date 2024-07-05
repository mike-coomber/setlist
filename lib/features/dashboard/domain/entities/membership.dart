import 'package:setlist/features/dashboard/domain/entities/role.dart';

class Membership {
  final String musicianId;
  final String bandId;
  final Role role;

  Membership({
    required this.musicianId,
    required this.bandId,
    required this.role,
  });
}

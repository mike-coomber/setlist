import 'membership.dart';

class Musician {
  final String id;
  final String name;
  final List<Membership> memberships;

  Musician({required this.id, required this.name, required this.memberships});
}

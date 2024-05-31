import 'membership.dart';

class Band {
  final String id;
  final String name;
  final List<Membership> members;

  Band({
    required this.id,
    required this.name,
    required this.members,
  });
}

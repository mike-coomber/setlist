import '../entities/role.dart';

abstract class MembershipRepository {
  Future<String> createMembership({required String bandId, required String musicianId, required Role role});
}

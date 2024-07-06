import 'package:setlist/features/dashboard/domain/entities/membership.dart';

import '../entities/role.dart';

abstract class MembershipRepository {
  Future<String> createMembership({
    required String bandId,
    required String musicianId,
    required Role role,
  });

  Future<List<Membership>> getMemberships({required String userId});
}

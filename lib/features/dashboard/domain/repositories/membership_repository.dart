import 'package:setlist/features/dashboard/domain/entities/membership.dart';

abstract class MembershipRepository {
  Future<List<Membership>> getMemberships({required String userId});

  Stream<List<Membership>> membershipUpdateNotifier({required String userId});
}

import 'package:setlist/features/dashboard/domain/entities/membership.dart';

abstract class MembershipRepository {
  Future<List<Membership>> getMembershipsFromUserId({required String userId});

  Future<List<Membership>> getMembershipsFromBandId({required String bandId});

  Stream<List<Membership>> membershipUpdateNotifier({required String userId});
}

import 'package:setlist/core/domain/entities/membership.dart';

abstract class MembershipRepository {
  Future<List<Membership>> getMembershipsFromMusicianId({required String userId});

  Future<List<Membership>> getMembershipsFromBandId({required String bandId});

  Future<void> createMemberships({required List<Membership> memberships});

  Future<void> createMembership({required Membership membership});

  Stream<List<Membership>> membershipUpdateNotifier({required String userId});
}

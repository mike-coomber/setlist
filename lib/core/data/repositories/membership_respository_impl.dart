import 'package:setlist/core/data/datasources/membership_remote_data_source.dart';
import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';

class MembershipRespositoryImpl extends MembershipRepository {
  final MembershipRemoteDataSource membershipRemoteDataSource;

  MembershipRespositoryImpl({required this.membershipRemoteDataSource});

  @override
  Future<List<Membership>> getMembershipsFromMusicianId({required String userId}) {
    return membershipRemoteDataSource.getMembershipsFromMusicianId(userId: userId);
  }

  @override
  Stream<List<Membership>> membershipUpdateNotifier({required String userId}) {
    return membershipRemoteDataSource.membershipUpdateNotifier(userId: userId);
  }

  @override
  Future<List<Membership>> getMembershipsFromBandId({required String bandId}) {
    return membershipRemoteDataSource.getMembershipsFromBandId(bandId: bandId);
  }

  @override
  Future<void> createMembership({required Membership membership}) {
    return membershipRemoteDataSource.createMembership(membership: membership);
  }

  @override
  Future<void> createMemberships({required List<Membership> memberships}) {
    return membershipRemoteDataSource.createMemeberships(memberships: memberships);
  }
}

import 'package:setlist/core/data/datasources/membership_remote_data_source.dart';
import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';

class MembershipRespositoryImpl extends MembershipRepository {
  final MembershipRemoteDataSource membershipRemoteDataSource;

  MembershipRespositoryImpl({required this.membershipRemoteDataSource});

  @override
  Future<List<Membership>> getMembershipsFromUserId({required String userId}) {
    return membershipRemoteDataSource.getMembershipsFromUserId(userId: userId);
  }

  @override
  Stream<List<Membership>> membershipUpdateNotifier({required String userId}) {
    return membershipRemoteDataSource.membershipUpdateNotifier(userId: userId);
  }

  @override
  Future<List<Membership>> getMembershipsFromBandId({required String bandId}) {
    return membershipRemoteDataSource.getMembershipsFromBandId(bandId: bandId);
  }
}

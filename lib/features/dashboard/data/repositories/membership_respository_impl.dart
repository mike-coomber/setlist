import 'package:setlist/features/dashboard/data/datasources/membership_remote_data_source.dart';
import 'package:setlist/features/dashboard/domain/entities/membership.dart';
import 'package:setlist/features/dashboard/domain/entities/role.dart';
import 'package:setlist/features/dashboard/domain/repositories/membership_repository.dart';

class MembershipRespositoryImpl extends MembershipRepository {
  final MembershipRemoteDataSource membershipRemoteDataSource;

  MembershipRespositoryImpl({required this.membershipRemoteDataSource});

  @override
  Future<String> createMembership({required String bandId, required String musicianId, required Role role}) {
    return membershipRemoteDataSource.createMembership(
      musicianId: musicianId,
      bandId: bandId,
      role: role,
    );
  }

  @override
  Future<List<Membership>> getMemberships({required String userId}) {
    return membershipRemoteDataSource.getMemberships(userId: userId);
  }
}

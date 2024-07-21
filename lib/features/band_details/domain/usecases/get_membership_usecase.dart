import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';

class GetMembershipUsecase {
  final MembershipRepository membershipRepository;

  GetMembershipUsecase({required this.membershipRepository});

  Future<Membership> call({required String musicianId, required String bandId}) async {
    return await membershipRepository.getMembership(musicianId: musicianId, bandId: bandId);
  }
}

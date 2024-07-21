import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';

class GetMembershipUseCase {
  final MembershipRepository membershipRepository;

  GetMembershipUseCase({required this.membershipRepository});

  Future<Membership> call({required String userId, required String bandId}) {
    return membershipRepository.getMembership(musicianId: userId, bandId: bandId);
  }
}

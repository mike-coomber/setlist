import 'package:setlist/core/domain/repositories/membership_repository.dart';

class DeleteMembershipUsecase {
  final MembershipRepository membershipRepository;

  DeleteMembershipUsecase({required this.membershipRepository});

  Future<void> call({required String musicianId, required String bandId}) {
    return membershipRepository.deleteMembership(musicianId: musicianId, bandId: bandId);
  }
}

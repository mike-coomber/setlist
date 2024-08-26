import 'package:setlist/core/data/db_consts.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';

class LeaveBandUsecase {
  final MembershipRepository _membershipRepository;

  LeaveBandUsecase({
    required MembershipRepository membershipRepository,
  }) : _membershipRepository = membershipRepository;

  Future<void> call({
    required String userId,
    required String bandId,
    String? newFounderId,
  }) async {
    await _membershipRepository.deleteMembership(musicianId: userId, bandId: bandId);
    if (newFounderId != null) {
      await _membershipRepository.updateRole(
        userId: newFounderId,
        bandId: bandId,
        newRoleId: kFounderRoleId,
      );
    }
  }
}

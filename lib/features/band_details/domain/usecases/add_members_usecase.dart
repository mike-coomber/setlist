import 'package:setlist/core/data/db_consts.dart';
import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';

class AddMembersUsecase {
  final MembershipRepository membershipRepository;

  AddMembersUsecase({required this.membershipRepository});

  Future<void> call({required List<String> musicianIds, required String bandId}) {
    final memberships = musicianIds
        .map(
          (musicianId) => Membership(
            musicianId: musicianId,
            bandId: bandId,
            roleId: kMemberRoleId,
          ),
        )
        .toList();

    return membershipRepository.createMemberships(memberships: memberships);
  }
}

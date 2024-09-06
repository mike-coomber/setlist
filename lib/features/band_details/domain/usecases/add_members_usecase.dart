import 'package:setlist/core/data/db_consts.dart';
import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/entities/musician.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';

class AddMembersUsecase {
  final MembershipRepository membershipRepository;

  AddMembersUsecase({required this.membershipRepository});

  Future<void> call({
    required List<Musician> musicians,
    required String bandId,
    required String bandName,
  }) {
    final memberships = musicians
        .map(
          (musician) => Membership(
            musicianId: musician.id,
            musicianName: musician.name,
            bandId: bandId,
            bandName: bandName,
            roleId: kMemberRoleId,
          ),
        )
        .toList();

    return membershipRepository.createMemberships(memberships: memberships);
  }
}

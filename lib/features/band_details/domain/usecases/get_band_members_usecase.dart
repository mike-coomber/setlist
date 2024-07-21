import 'package:setlist/core/domain/repositories/membership_repository.dart';
import 'package:setlist/core/domain/repositories/musician_repository.dart';

import '../../../../core/domain/entities/musician.dart';

class GetBandMembersUsecase {
  final MembershipRepository membershipRepository;
  final MusicianRepository musicianRepository;

  GetBandMembersUsecase({
    required this.membershipRepository,
    required this.musicianRepository,
  });

  Future<List<Musician>> call({required String bandId}) async {
    final memberships = await membershipRepository.getMembershipsFromBandId(bandId: bandId);

    final musicianIds = memberships.map((membership) => membership.musicianId).toList();

    return await musicianRepository.getMusicians(musicianIds: musicianIds);
  }
}

import 'package:setlist/features/dashboard/domain/entities/role.dart';
import 'package:setlist/features/dashboard/domain/repositories/band_repository.dart';
import 'package:setlist/features/dashboard/domain/repositories/membership_repository.dart';
import 'package:setlist/features/dashboard/domain/repositories/musician_repository.dart';

class CreateBandUsecase {
  final BandRepository bandRepository;
  final MembershipRepository membershipRepository;
  final MusicianRepository musicianRepository;

  CreateBandUsecase({
    required this.bandRepository,
    required this.membershipRepository,
    required this.musicianRepository,
  });

  Future<void> call({
    required String bandName,
    required String userId,
  }) async {
    try {
      final bandId = await bandRepository.createBand(bandName: bandName);
      final membershipId = await membershipRepository.createMembership(
        bandId: bandId,
        musicianId: userId,
        role: Role.founder(),
      );
      await Future.wait(
        [
          musicianRepository.addMembership(musicianId: userId, membershipId: membershipId),
          bandRepository.addMembership(bandId: bandId, membershipId: membershipId),
        ],
      );
    } catch (e) {
      // TODO: handle error
    }
  }
}

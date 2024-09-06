import 'package:setlist/core/data/db_consts.dart';
import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/repositories/band_repository.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';
import 'package:setlist/core/domain/repositories/musician_repository.dart';

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
    required String founderName,
    required String userId,
  }) async {
    final band = await bandRepository.createBand(bandName: bandName);
    await membershipRepository.createMembership(
      membership: Membership(
        musicianName: founderName,
        bandName: bandName,
        musicianId: userId,
        bandId: band.id,
        roleId: kFounderRoleId,
      ),
    );
  }
}

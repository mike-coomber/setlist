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
    required String userId,
  }) async {
    await bandRepository.createBand(bandName: bandName);
  }
}

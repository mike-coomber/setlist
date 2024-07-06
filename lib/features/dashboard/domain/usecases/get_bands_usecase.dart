import 'package:setlist/features/dashboard/domain/repositories/band_repository.dart';
import 'package:setlist/features/dashboard/domain/repositories/membership_repository.dart';

import '../entities/band.dart';

class GetBandsUsecase {
  final BandRepository bandRepository;
  final MembershipRepository membershipRepository;

  GetBandsUsecase({
    required this.bandRepository,
    required this.membershipRepository,
  });

  Future<List<Band>> call({required String userId}) async {
    final memerships = await membershipRepository.getMemberships(userId: userId);

    if (memerships.isEmpty) return [];

    final bandIds = memerships.map((membership) => membership.bandId).toList();

    return bandRepository.getBands(bandIds: bandIds);
  }
}

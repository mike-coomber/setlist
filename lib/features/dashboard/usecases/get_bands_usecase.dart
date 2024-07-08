import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/repositories/band_repository.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';

import '../../../core/domain/entities/band.dart';

class GetBandsUsecase {
  final BandRepository bandRepository;
  final MembershipRepository membershipRepository;

  GetBandsUsecase({
    required this.bandRepository,
    required this.membershipRepository,
  });

  Future<List<Band>> call({required List<Membership> memberships}) async {
    if (memberships.isEmpty) return [];

    final bandIds = memberships.map((membership) => membership.bandId).toList();

    return bandRepository.getBands(bandIds: bandIds);
  }
}

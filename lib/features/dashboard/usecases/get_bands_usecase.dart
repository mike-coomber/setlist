import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';

class GetBandsUsecase {
  final MembershipRepository membershipRepository;

  GetBandsUsecase({
    required this.membershipRepository,
  });

  Future<List<Membership>> call({required String musicianId}) {
    return membershipRepository.getMembershipsFromMusicianId(userId: musicianId);
  }
}

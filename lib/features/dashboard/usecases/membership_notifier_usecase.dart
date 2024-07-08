import 'package:setlist/core/domain/entities/membership.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';

class MembershipNotifierUsecase {
  final MembershipRepository membershipRepository;

  MembershipNotifierUsecase({required this.membershipRepository});

  Stream<List<Membership>> call({required String userId}) {
    return membershipRepository.membershipUpdateNotifier(userId: userId);
  }
}

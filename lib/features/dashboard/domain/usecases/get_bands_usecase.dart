import 'package:setlist/features/dashboard/domain/repositories/band_repository.dart';

import '../entities/band.dart';

class GetBandsUsecase {
  final BandRepository bandRepository;

  GetBandsUsecase({required this.bandRepository});

  Future<List<Band>> call(String musicianId) {
    return bandRepository.getBands(musicianId: musicianId);
  }
}

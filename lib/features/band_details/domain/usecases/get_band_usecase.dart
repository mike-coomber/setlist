import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/core/domain/repositories/band_repository.dart';

class GetBandUsecase {
  final BandRepository bandRepository;

  GetBandUsecase({required this.bandRepository});

  Future<Band> call(String bandId) {
    return bandRepository.getBand(bandId: bandId);
  }
}

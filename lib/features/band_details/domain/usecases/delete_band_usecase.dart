import 'package:setlist/core/domain/repositories/band_repository.dart';

class DeleteBandUsecase {
  final BandRepository bandRepository;

  DeleteBandUsecase({required this.bandRepository});

  Future<void> call({required String bandId}) {
    return bandRepository.deleteBand(bandId: bandId);
  }
}

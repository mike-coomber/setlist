import 'package:setlist/features/dashboard/domain/repositories/band_repository.dart';

class CreateBandUsecase {
  final BandRepository bandRepository;

  CreateBandUsecase({required this.bandRepository});

  Future<void> call({required String bandName}) async {
    try {
      await bandRepository.createBand(bandName: bandName);
    } catch (e) {
      // TODO: handle error
    }
  }
}

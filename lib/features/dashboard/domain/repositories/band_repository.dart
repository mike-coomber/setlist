import '../entities/band.dart';

abstract class BandRepository {
  Future<List<Band>> getBands({required String musicianId});

  Future<void> createBand({required String bandName});
}

import '../entities/band.dart';

abstract class BandRepository {
  Future<Band> getBand({required String bandId});

  Future<List<Band>> getBands({required List<String> bandIds});

  Future<Band> createBand({required String bandName});

  Future<void> deleteBand({required String bandId});
}

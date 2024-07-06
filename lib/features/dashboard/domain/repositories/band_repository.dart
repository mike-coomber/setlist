import '../entities/band.dart';

abstract class BandRepository {
  Future<Band> getBand({required String bandId});

  Future<List<Band>> getBands({required List<String> bandIds});

  Future<String> createBand({required String bandName});

  Future<void> addMembership({required String bandId, required String membershipId});
}

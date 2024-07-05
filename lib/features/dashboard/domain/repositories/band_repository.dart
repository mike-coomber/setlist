import '../entities/band.dart';

abstract class BandRepository {
  Future<List<Band>> getBands({required String musicianId});

  Future<String> createBand({required String bandName});

  Future<void> addMembership({required String bandId, required String membershipId});
}

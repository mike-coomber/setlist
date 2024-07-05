import 'package:setlist/features/dashboard/domain/entities/band.dart';
import 'package:setlist/features/dashboard/domain/repositories/band_repository.dart';

class BandRepositoryImpl extends BandRepository {
  @override
  Future<void> addMembership({required String bandId, required String membershipId}) {
    // TODO: implement addMembership
    throw UnimplementedError();
  }

  @override
  Future<String> createBand({required String bandName}) {
    // TODO: implement createBand
    throw UnimplementedError();
  }

  @override
  Future<List<Band>> getBands({required String musicianId}) {
    // TODO: implement getBands
    throw UnimplementedError();
  }
}

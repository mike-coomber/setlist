import 'package:setlist/features/dashboard/data/datasources/band_remote_data_source.dart';
import 'package:setlist/features/dashboard/domain/entities/band.dart';
import 'package:setlist/features/dashboard/domain/repositories/band_repository.dart';

class BandRepositoryImpl extends BandRepository {
  final BandRemoteDataSource remoteDataSource;

  BandRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Band> createBand({required String bandName}) {
    return remoteDataSource.createBand(bandName: bandName);
  }

  @override
  Future<List<Band>> getBands({required List<String> bandIds}) {
    return remoteDataSource.getBands(bandIds: bandIds);
  }

  @override
  Future<Band> getBand({required String bandId}) {
    return remoteDataSource.getBand(bandId: bandId);
  }
}

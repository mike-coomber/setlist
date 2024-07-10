import 'package:setlist/core/data/datasources/band_remote_data_source.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/core/domain/repositories/band_repository.dart';

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

  @override
  Future<void> deleteBand({required String bandId}) {
    return remoteDataSource.deleteBand(bandId: bandId);
  }
}

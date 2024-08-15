import 'package:setlist/features/setlist_editor/data/datasources/setlist_remote_datasource.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist_event.dart';
import 'package:setlist/features/setlist_editor/domain/repositoires/setlist_repository.dart';

class SetlistRepositoryImpl implements SetlistRepository {
  final SetlistRemoteDatasource remoteDataSource;

  SetlistRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addSetlist({
    required String setlistName,
    required List<SetlistEvent> events,
    required String bandId,
  }) {
    return remoteDataSource.addSetlist(
      setlistName: setlistName,
      events: events,
      bandId: bandId,
    );
  }

  @override
  Future<Setlist> getSetlist({required String setlistId, required String bandId}) {
    return remoteDataSource.getSetlist(setlistId: setlistId, bandId: bandId);
  }

  @override
  Future<List<Setlist>> getSetlists({required String bandId}) {
    return remoteDataSource.getSetlists(bandId: bandId);
  }

  @override
  Future<void> updateSetlist({
    required String setlistName,
    required String setlistId,
    required List<SetlistEvent> events,
    required String bandId,
  }) {
    return remoteDataSource.updateSetlist(
      setlistName: setlistName,
      setlistId: setlistId,
      events: events,
      bandId: bandId,
    );
  }

  @override
  Future<void> deleteSetlist({required String setlistId, required String bandId}) {
    return remoteDataSource.deleteSetlist(setlistId: setlistId, bandId: bandId);
  }
}

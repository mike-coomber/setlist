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
    // TODO: implement getSetlist
    throw UnimplementedError();
  }
}

import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist_event.dart';

abstract class SetlistRepository {
  Future<void> addSetlist({
    required String setlistName,
    required List<SetlistEvent> events,
    required String bandId,
  });

  Future<void> updateSetlist({
    required String setlistName,
    required String setlistId,
    required List<SetlistEvent> events,
    required String bandId,
  });

  Future<Setlist> getSetlist({required String setlistId, required String bandId});

  Future<List<Setlist>> getSetlists({required String bandId});
}

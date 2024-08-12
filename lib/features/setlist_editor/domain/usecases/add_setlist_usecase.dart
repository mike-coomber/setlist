import 'package:setlist/features/setlist_editor/domain/entities/setlist_event.dart';
import 'package:setlist/features/setlist_editor/domain/repositoires/setlist_repository.dart';

class AddSetlistUsecase {
  final SetlistRepository _setlistRepository;

  AddSetlistUsecase({
    required SetlistRepository setlistRepository,
  }) : _setlistRepository = setlistRepository;

  Future<void> call({
    required String setlistName,
    required List<SetlistEvent> events,
    required String bandId,
  }) async {
    await _setlistRepository.addSetlist(
      setlistName: setlistName,
      events: events,
      bandId: bandId,
    );
  }
}

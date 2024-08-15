import 'package:setlist/features/setlist_editor/domain/entities/setlist_event.dart';
import 'package:setlist/features/setlist_editor/domain/repositoires/setlist_repository.dart';

class SaveSetlistUsecase {
  final SetlistRepository _setlistRepository;

  SaveSetlistUsecase({
    required SetlistRepository setlistRepository,
  }) : _setlistRepository = setlistRepository;

  Future<void> call({
    required String setlistName,
    required List<SetlistEvent> events,
    required String bandId,
    required String? setlistId,
  }) async {
    if (setlistId != null) {
      return await _setlistRepository.updateSetlist(
        setlistName: setlistName,
        events: events,
        bandId: bandId,
        setlistId: setlistId,
      );
    } else {
      return await _setlistRepository.addSetlist(
        setlistName: setlistName,
        events: events,
        bandId: bandId,
      );
    }
  }
}

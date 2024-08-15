import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/features/setlist_editor/domain/repositoires/setlist_repository.dart';

class GetSetlistUsecase {
  final SetlistRepository _setlistRepository;

  const GetSetlistUsecase({
    required SetlistRepository setlistRepository,
  }) : _setlistRepository = setlistRepository;

  Future<Setlist> call({required String setlistId, required String bandId}) {
    return _setlistRepository.getSetlist(
      setlistId: setlistId,
      bandId: bandId,
    );
  }
}

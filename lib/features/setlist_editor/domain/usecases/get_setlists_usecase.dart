import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/features/setlist_editor/domain/repositoires/setlist_repository.dart';

class GetSetlistsUsecase {
  final SetlistRepository _setlistRepository;

  GetSetlistsUsecase({
    required SetlistRepository setlistRepository,
  }) : _setlistRepository = setlistRepository;

  Future<List<Setlist>> call({required String bandId}) async {
    return _setlistRepository.getSetlists(bandId: bandId);
  }
}

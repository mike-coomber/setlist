import 'package:setlist/features/setlist_editor/domain/repositoires/setlist_repository.dart';

class DeleteSetlistUsecase {
  final SetlistRepository _repository;

  DeleteSetlistUsecase({
    required SetlistRepository setlistRepository,
  }) : _repository = setlistRepository;

  Future<void> call({
    required String setlistId,
    required String bandId,
  }) {
    return _repository.deleteSetlist(
      setlistId: setlistId,
      bandId: bandId,
    );
  }
}

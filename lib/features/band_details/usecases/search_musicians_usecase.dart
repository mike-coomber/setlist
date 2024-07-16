import 'package:setlist/core/domain/entities/musician.dart';
import 'package:setlist/core/domain/repositories/musician_repository.dart';

class SearchMusiciansUsecase {
  final MusicianRepository musicianRepository;

  SearchMusiciansUsecase({required this.musicianRepository});

  Future<List<Musician>> call({required String searchStr}) {
    return musicianRepository.searchMusicians(searchStr: searchStr);
  }
}

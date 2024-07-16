part of 'add_members_cubit.dart';

class AddMembersState extends Equatable {
  const AddMembersState({
    this.searchTerm = '',
    this.selectedMusicianIds = const [],
    this.searchResults = const [],
    this.status = FormStatus.initial,
  });

  final String searchTerm;
  final List<Musician> searchResults;
  final List<String> selectedMusicianIds;
  final FormStatus status;

  @override
  List<Object> get props => [searchTerm, searchResults, selectedMusicianIds];

  AddMembersState copyWith({
    String? searchTerm,
    List<Musician>? searchResults,
    List<String>? selectedMusicianIds,
    FormStatus? status,
  }) {
    return AddMembersState(
      searchTerm: searchTerm ?? this.searchTerm,
      selectedMusicianIds: selectedMusicianIds ?? this.selectedMusicianIds,
      searchResults: searchResults ?? this.searchResults,
      status: status ?? this.status,
    );
  }
}

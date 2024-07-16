part of 'add_members_cubit.dart';

class AddMembersState extends Equatable {
  const AddMembersState({
    this.searchTerm = '',
    this.selectedMusicianIds = const [],
    this.searchResults = const [],
    this.searchStatus = FormStatus.initial,
    this.submitStatus = FormStatus.initial,
  });

  final String searchTerm;
  final List<Musician> searchResults;
  final List<String> selectedMusicianIds;
  final FormStatus searchStatus;
  final FormStatus submitStatus;

  @override
  List<Object> get props => [
        searchTerm,
        searchResults,
        selectedMusicianIds,
        searchStatus,
        submitStatus,
      ];

  AddMembersState copyWith({
    String? searchTerm,
    List<Musician>? searchResults,
    List<String>? selectedMusicianIds,
    FormStatus? searchStatus,
    FormStatus? submitStatus,
  }) {
    return AddMembersState(
      searchTerm: searchTerm ?? this.searchTerm,
      selectedMusicianIds: selectedMusicianIds ?? this.selectedMusicianIds,
      searchResults: searchResults ?? this.searchResults,
      searchStatus: searchStatus ?? this.searchStatus,
      submitStatus: submitStatus ?? this.submitStatus,
    );
  }
}

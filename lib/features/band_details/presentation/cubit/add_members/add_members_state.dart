part of 'add_members_cubit.dart';

class AddMembersState extends Equatable {
  const AddMembersState({
    this.searchTerm = '',
    this.selectedMusicians = const [],
    this.searchResults = const [],
    this.searchStatus = FormStatus.initial,
    this.submitStatus = FormStatus.initial,
  });

  final String searchTerm;
  final List<Musician> searchResults;
  final List<Musician> selectedMusicians;
  final FormStatus searchStatus;
  final FormStatus submitStatus;

  @override
  List<Object> get props => [
        searchTerm,
        searchResults,
        selectedMusicians,
        searchStatus,
        submitStatus,
      ];

  AddMembersState copyWith({
    String? searchTerm,
    List<Musician>? searchResults,
    List<Musician>? selectedMusicians,
    FormStatus? searchStatus,
    FormStatus? submitStatus,
  }) {
    return AddMembersState(
      searchTerm: searchTerm ?? this.searchTerm,
      selectedMusicians: selectedMusicians ?? this.selectedMusicians,
      searchResults: searchResults ?? this.searchResults,
      searchStatus: searchStatus ?? this.searchStatus,
      submitStatus: submitStatus ?? this.submitStatus,
    );
  }
}

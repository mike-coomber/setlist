part of 'add_members_cubit.dart';

class AddMembersState extends Equatable {
  const AddMembersState({
    required this.searchTerm,
    required this.selectedMusicians,
    required this.searchResults,
    required this.status,
  });

  final String searchTerm;
  final List<Musician> searchResults;
  final List<Musician> selectedMusicians;
  final FormStatus status;

  @override
  List<Object> get props => [searchTerm, searchResults, selectedMusicians];

  AddMembersState copyWith({
    String? searchTerm,
    List<Musician>? searchResults,
    List<Musician>? selectedMusicians,
    FormStatus? status,
  }) {
    return AddMembersState(
      searchTerm: searchTerm ?? this.searchTerm,
      selectedMusicians: selectedMusicians ?? this.selectedMusicians,
      searchResults: searchResults ?? this.searchResults,
      status: status ?? this.status,
    );
  }
}

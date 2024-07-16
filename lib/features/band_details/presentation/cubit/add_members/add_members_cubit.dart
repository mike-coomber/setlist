import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/utils/deboucer.dart';
import 'package:setlist/features/auth/presentation/cubit/form_status.dart';
import 'package:setlist/features/band_details/usecases/add_members_usecase.dart';
import 'package:setlist/features/band_details/usecases/search_musicians_usecase.dart';

import '../../../../../core/domain/entities/musician.dart';

part 'add_members_state.dart';

class AddMembersCubit extends Cubit<AddMembersState> {
  final SearchMusiciansUsecase searchMusiciansUsecase;
  final AddMembersUsecase addMembersUsecase;

  final _searchDebounce = Debouncer(milliseconds: 500);

  AddMembersCubit({
    required this.searchMusiciansUsecase,
    required this.addMembersUsecase,
  }) : super(
          const AddMembersState(
            searchTerm: '',
            searchResults: [],
            selectedMusicianIds: [],
            status: FormStatus.initial,
          ),
        );

  void onSearchChanged(String value) {
    if (value.isEmpty) {
      _searchDebounce.cancel();
      emit(state.copyWith(searchResults: [], status: FormStatus.initial));
    } else {
      emit(state.copyWith(searchTerm: value, status: FormStatus.loading));

      _searchDebounce.run(_searchUsers);
    }
  }

  void _searchUsers() async {
    try {
      final searchResults = await searchMusiciansUsecase.call(searchStr: state.searchTerm);

      emit(state.copyWith(searchResults: searchResults, status: FormStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void onMusicianSelected({required String musicianId}) {
    if (state.selectedMusicianIds.contains(musicianId)) {
      final newMusicianIds = state.selectedMusicianIds.where((id) => id != musicianId).toList();
      emit(state.copyWith(selectedMusicianIds: newMusicianIds));
    } else {
      emit(
        state.copyWith(
          selectedMusicianIds: [...state.selectedMusicianIds, musicianId],
        ),
      );
    }
  }
}

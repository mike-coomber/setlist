import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/core/domain/entities/band.dart';
import 'package:setlist/core/utils/deboucer.dart';
import 'package:setlist/features/auth/presentation/cubit/form_status.dart';
import 'package:setlist/features/band_details/domain/usecases/add_members_usecase.dart';
import 'package:setlist/features/band_details/domain/usecases/search_musicians_usecase.dart';

import '../../../../../core/domain/entities/musician.dart';

part 'add_members_state.dart';

class AddMembersCubit extends Cubit<AddMembersState> {
  final SearchMusiciansUsecase searchMusiciansUsecase;
  final AddMembersUsecase addMembersUsecase;

  final List<String> currentMemberMusicianIds;

  final _searchDebounce = Debouncer(milliseconds: 500);

  AddMembersCubit({
    required this.searchMusiciansUsecase,
    required this.addMembersUsecase,
    required this.currentMemberMusicianIds,
  }) : super(
          const AddMembersState(
            searchTerm: '',
            searchResults: [],
            selectedMusicians: [],
            searchStatus: FormStatus.initial,
          ),
        );

  void onSearchChanged(String value) {
    if (value.isEmpty) {
      _searchDebounce.cancel();
      emit(state.copyWith(searchResults: [], searchStatus: FormStatus.initial));
    } else {
      emit(state.copyWith(searchTerm: value, searchStatus: FormStatus.loading));

      _searchDebounce.run(_searchUsers);
    }
  }

  void _searchUsers() async {
    try {
      final searchResults = await searchMusiciansUsecase.call(
        searchStr: state.searchTerm,
        currentMemberMusicianIds: currentMemberMusicianIds,
      );

      emit(
        state.copyWith(
          searchResults: searchResults,
          searchStatus: FormStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(searchStatus: FormStatus.error));
    }
  }

  void onMusicianSelected({required Musician musician}) {
    if (state.selectedMusicians.contains(musician)) {
      final newMusicianIds = state.selectedMusicians
          .where(
            (id) => id != musician,
          )
          .toList();
      emit(state.copyWith(selectedMusicians: newMusicianIds));
    } else {
      emit(
        state.copyWith(
          selectedMusicians: [...state.selectedMusicians, musician],
        ),
      );
    }
  }

  Future<void> addMembers({required Band band}) async {
    emit(state.copyWith(submitStatus: FormStatus.loading));
    try {
      await addMembersUsecase.call(
        musicians: state.selectedMusicians,
        bandId: band.id,
        bandName: band.name,
      );

      emit(state.copyWith(submitStatus: FormStatus.success));
    } catch (e) {
      emit(state.copyWith(submitStatus: FormStatus.error));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:setlist/core/utils/deboucer.dart';
import 'package:setlist/features/auth/presentation/cubit/form_status.dart';
import 'package:setlist/features/band_details/usecases/search_musicians_usecase.dart';

import '../../../../../core/domain/entities/musician.dart';

part 'add_members_state.dart';

class AddMembersCubit extends Cubit<AddMembersState> {
  final SearchMusiciansUsecase searchMusiciansUsecase;

  final _searchDebounce = Debouncer(milliseconds: 500);

  AddMembersCubit({required this.searchMusiciansUsecase})
      : super(
          const AddMembersState(
            searchTerm: '',
            searchResults: [],
            selectedMusicians: [],
            status: FormStatus.initial,
          ),
        );

  void onSearchChanged(String value) {
    emit(state.copyWith(searchTerm: value, status: FormStatus.loading));

    _searchDebounce.run(_searchUsers);
  }

  void _searchUsers() async {
    try {
      final searchResults = await searchMusiciansUsecase.call(searchStr: state.searchTerm);

      emit(state.copyWith(searchResults: searchResults, status: FormStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }
}

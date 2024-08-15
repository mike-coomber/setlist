import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';

part 'setlist_view_state.dart';

class SetlistViewCubit extends Cubit<SetlistViewState> {
  final String bandId;
  final Setlist setlist;

  SetlistViewCubit({
    required this.setlist,
    required this.bandId,
  }) : super(SetlistViewInitial(setlist));

  Future<void> findAndUpdateSetlist(List<Setlist>? newSetlists) async {
    if (newSetlists == null) {
      emit(SetlistViewError(setlist));
      return;
    }
    emit(SetlistViewLoading(setlist));
    try {
      final updatedSetlist = newSetlists.firstWhere(
        (setlist) => setlist.id == this.setlist.id,
      );
      emit(
        SetlistViewInitial(
          updatedSetlist,
          setlistUpdated: true,
        ),
      );
    } catch (e) {
      emit(SetlistViewError(setlist));
    }
  }
}

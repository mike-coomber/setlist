part of 'setlist_view_cubit.dart';

sealed class SetlistViewState extends Equatable {
  const SetlistViewState(this.setlist);

  final Setlist setlist;

  @override
  List<Object> get props => [setlist];
}

class SetlistViewInitial extends SetlistViewState {
  const SetlistViewInitial(super.setlist);
}

class SetlistViewLoading extends SetlistViewState {
  const SetlistViewLoading(super.setlist);
}

class SetlistViewError extends SetlistViewState {
  const SetlistViewError(super.setlist);
}

class SetlistViewDeleted extends SetlistViewState {
  const SetlistViewDeleted(super.setlist);
}

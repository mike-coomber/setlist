import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_musician_state.dart';

class CreateMusicianCubit extends Cubit<CreateMusicianState> {
  CreateMusicianCubit() : super(CreateMusicianInitial());
}

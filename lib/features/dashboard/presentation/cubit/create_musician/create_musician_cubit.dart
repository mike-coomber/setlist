import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setlist/features/auth/presentation/cubit/form_status.dart';
import 'package:setlist/features/dashboard/domain/entities/musician.dart';
import 'package:setlist/features/dashboard/domain/usecases/create_musician_usecase.dart';

part 'create_musician_state.dart';

class CreateMusicianCubit extends Cubit<CreateMusicianState> {
  CreateMusicianCubit({
    required this.createMusicianUsecase,
  }) : super(const CreateMusicianStateForm(
          name: '',
          status: FormStatus.initial,
        ));

  final CreateMusicianUsecase createMusicianUsecase;

  onNameChanged(String name) {
    emit((state as CreateMusicianStateForm).copyWith(name: name));
  }

  Future<void> createMusician(String id) async {
    final castedState = state as CreateMusicianStateForm;
    try {
      emit(castedState.copyWith(status: FormStatus.loading));
      final createdMusician = await createMusicianUsecase.call(
        name: castedState.name,
        id: id,
      );
      emit(CreateMusicianStateSuccessful(createdMusician: createdMusician));
    } catch (e) {
      emit(
        (state as CreateMusicianStateForm).copyWith(
          status: FormStatus.error,
        ),
      );
    }
  }
}

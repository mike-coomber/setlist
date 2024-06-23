part of 'create_musician_cubit.dart';

sealed class CreateMusicianState extends Equatable {
  const CreateMusicianState();

  @override
  List<Object> get props => [];
}

class CreateMusicianStateForm extends CreateMusicianState {
  const CreateMusicianStateForm({
    required this.name,
    required this.status,
  });

  final FormStatus status;
  final String name;

  CreateMusicianStateForm copyWith({
    String? name,
    FormStatus? status,
  }) {
    return CreateMusicianStateForm(
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [name, status];
}

class CreateMusicianStateSuccessful extends CreateMusicianState {
  const CreateMusicianStateSuccessful({required this.createdMusician});

  final Musician createdMusician;

  @override
  List<Object> get props => [createdMusician];
}

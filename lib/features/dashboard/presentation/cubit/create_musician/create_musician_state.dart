part of 'create_musician_cubit.dart';

sealed class CreateMusicianState extends Equatable {
  const CreateMusicianState();

  @override
  List<Object> get props => [];
}

final class CreateMusicianInitial extends CreateMusicianState {}

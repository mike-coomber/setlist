part of 'create_band_cubit.dart';

final class CreateBandState extends Equatable {
  final String name;
  final FormStatus status;

  const CreateBandState({required this.name, required this.status});

  CreateBandState copyWith({
    String? name,
    FormStatus? status,
  }) {
    return CreateBandState(
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [name, status];
}

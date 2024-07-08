import 'package:setlist/core/domain/entities/musician.dart';

import 'package:json_annotation/json_annotation.dart';

part 'musician_model.g.dart';

@JsonSerializable()
class MusicianModel implements Musician {
  MusicianModel({
    required this.id,
    required this.name,
  });

  @override
  final String id;

  @override
  final String name;

  factory MusicianModel.fromJson(Map<String, dynamic> json) => _$MusicianModelFromJson(json);

  Map<String, dynamic> toJson() => _$MusicianModelToJson(this);
}

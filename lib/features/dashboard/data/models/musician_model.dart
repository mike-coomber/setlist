import 'package:setlist/features/dashboard/data/models/membership_model.dart';
import 'package:setlist/features/dashboard/domain/entities/musician.dart';

import 'package:json_annotation/json_annotation.dart';

part 'musician_model.g.dart';

@JsonSerializable()
class MusicianModel implements Musician {
  MusicianModel({
    required this.id,
    required this.name,
    required this.memberships,
  });

  @override
  final String id;

  @override
  final List<MembershipModel> memberships;

  @override
  final String name;

  factory MusicianModel.fromJson(Map<String, dynamic> json) => _$MusicianModelFromJson(json);

  Map<String, dynamic> toJson() => _$MusicianModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:setlist/core/domain/entities/membership.dart';

part 'membership_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MembershipModel implements Membership {
  @override
  final String bandId;

  @override
  final String musicianId;

  @override
  final String roleId;

  @override
  final String musicianName;

  @override
  final String bandName;

  MembershipModel({
    required this.bandId,
    required this.musicianId,
    required this.roleId,
    required this.musicianName,
    required this.bandName,
  });

  factory MembershipModel.fromEntity(Membership membership) => MembershipModel(
        bandId: membership.bandId,
        musicianId: membership.musicianId,
        roleId: membership.roleId,
        musicianName: membership.musicianName,
        bandName: membership.bandName,
      );

  factory MembershipModel.fromJson(Map<String, dynamic> json) => _$MembershipModelFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipModelToJson(this);
}

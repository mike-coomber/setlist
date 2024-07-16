import 'package:json_annotation/json_annotation.dart';
import 'package:setlist/core/data/models/role_model.dart';
import 'package:setlist/core/domain/entities/membership.dart';

part 'membership_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MembershipModel implements Membership {
  @override
  final String bandId;

  @override
  final String musicianId;

  @override
  final RoleModel role;

  MembershipModel({
    required this.bandId,
    required this.musicianId,
    required this.role,
  });

  factory MembershipModel.fromEntity(Membership membership) => MembershipModel(
        bandId: membership.bandId,
        musicianId: membership.musicianId,
        role: RoleModel.fromEntity(
          membership.role,
        ),
      );

  factory MembershipModel.fromJson(Map<String, dynamic> json) => _$MembershipModelFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipModelToJson(this);
}

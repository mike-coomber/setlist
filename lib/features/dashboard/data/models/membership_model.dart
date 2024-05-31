import 'package:json_annotation/json_annotation.dart';
import 'package:setlist/features/dashboard/domain/entities/membership.dart';

part 'membership_model.g.dart';

@JsonSerializable()
class MembershipModel implements Membership {
  MembershipModel({
    required this.musicianId,
    required this.bandId,
  });

  factory MembershipModel.fromJson(Map<String, dynamic> json) => _$MembershipModelFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipModelToJson(this);

  @override
  final String bandId;

  @override
  final String musicianId;
}

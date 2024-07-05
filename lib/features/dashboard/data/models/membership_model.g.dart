// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembershipModel _$MembershipModelFromJson(Map<String, dynamic> json) =>
    MembershipModel(
      bandId: json['bandId'] as String,
      musicianId: json['musicianId'] as String,
      role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MembershipModelToJson(MembershipModel instance) =>
    <String, dynamic>{
      'bandId': instance.bandId,
      'musicianId': instance.musicianId,
      'role': instance.role.toJson(),
    };

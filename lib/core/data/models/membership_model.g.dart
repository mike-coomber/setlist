// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembershipModel _$MembershipModelFromJson(Map<String, dynamic> json) =>
    MembershipModel(
      bandId: json['bandId'] as String,
      musicianId: json['musicianId'] as String,
      roleId: json['roleId'] as String,
    );

Map<String, dynamic> _$MembershipModelToJson(MembershipModel instance) =>
    <String, dynamic>{
      'bandId': instance.bandId,
      'musicianId': instance.musicianId,
      'roleId': instance.roleId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musician_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicianModel _$MusicianModelFromJson(Map<String, dynamic> json) =>
    MusicianModel(
      id: json['id'] as String,
      name: json['name'] as String,
      memberships: (json['memberships'] as List<dynamic>)
          .map((e) => MembershipModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MusicianModelToJson(MusicianModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberships': instance.memberships,
      'name': instance.name,
    };

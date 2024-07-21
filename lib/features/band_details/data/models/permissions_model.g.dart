// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionsModel _$PermissionsModelFromJson(Map<String, dynamic> json) =>
    PermissionsModel(
      canAddMembers: json['canAddMembers'] as bool?,
      canRemoveMembers: json['canRemoveMembers'] as bool?,
      canDeleteBand: json['canDeleteBand'] as bool? ?? false,
    );

Map<String, dynamic> _$PermissionsModelToJson(PermissionsModel instance) =>
    <String, dynamic>{
      'canAddMembers': instance.canAddMembers,
      'canRemoveMembers': instance.canRemoveMembers,
      'canDeleteBand': instance.canDeleteBand,
    };

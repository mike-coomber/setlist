// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
      name: json['name'] as String,
      permissions: PermissionsModel.fromJson(
          json['permissions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
      'name': instance.name,
      'permissions': instance.permissions.toJson(),
    };

PermissionsModel _$PermissionsModelFromJson(Map<String, dynamic> json) =>
    PermissionsModel(
      canAddMembers: json['canAddMembers'] as bool,
      canRemoveMembers: json['canRemoveMembers'] as bool,
    );

Map<String, dynamic> _$PermissionsModelToJson(PermissionsModel instance) =>
    <String, dynamic>{
      'canAddMembers': instance.canAddMembers,
      'canRemoveMembers': instance.canRemoveMembers,
    };

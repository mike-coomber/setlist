import 'package:json_annotation/json_annotation.dart';
import 'package:setlist/core/domain/entities/role.dart';

part 'role_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RoleModel implements Role {
  @override
  final String name;

  @override
  final PermissionsModel permissions;

  RoleModel({required this.name, required this.permissions});

  factory RoleModel.fromEntity(Role entity) => RoleModel(
        name: entity.name,
        permissions: PermissionsModel.fromEntity(entity.permissions),
      );

  factory RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}

@JsonSerializable()
class PermissionsModel implements Permissions {
  @override
  final bool canAddMembers;

  @override
  final bool canRemoveMembers;

  @override
  final bool canDeleteBand;

  PermissionsModel({bool? canAddMembers, bool? canRemoveMembers, bool? canDeleteBand = false})
      : canAddMembers = canAddMembers ?? false,
        canRemoveMembers = canRemoveMembers ?? false,
        canDeleteBand = canDeleteBand ?? false;

  factory PermissionsModel.fromEntity(Permissions entity) => PermissionsModel(
        canAddMembers: entity.canAddMembers,
        canRemoveMembers: entity.canRemoveMembers,
        canDeleteBand: entity.canDeleteBand,
      );

  factory PermissionsModel.fromJson(Map<String, dynamic> json) => _$PermissionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionsModelToJson(this);
}

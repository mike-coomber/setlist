import 'package:json_annotation/json_annotation.dart';
import 'package:setlist/features/dashboard/domain/entities/role.dart';

part 'role_model.g.dart';

@JsonSerializable()
class RoleModel implements Role {
  @override
  final String name;

  @override
  final PermissionsModel permissions;

  RoleModel({required this.name, required this.permissions});

  factory RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}

@JsonSerializable()
class PermissionsModel implements Permissions {
  @override
  final bool canAddMembers;

  @override
  final bool canRemoveMembers;

  PermissionsModel({required this.canAddMembers, required this.canRemoveMembers});

  factory PermissionsModel.fromJson(Map<String, dynamic> json) => _$PermissionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionsModelToJson(this);
}

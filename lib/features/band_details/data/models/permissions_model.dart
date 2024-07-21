import 'package:json_annotation/json_annotation.dart';
import 'package:setlist/features/band_details/domain/models/permissions.dart';

part 'permissions_model.g.dart';

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

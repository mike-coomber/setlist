import 'package:json_annotation/json_annotation.dart';
import 'package:setlist/features/band_details/domain/entities/permissions.dart';

part 'permissions_model.g.dart';

@JsonSerializable()
class PermissionsModel implements Permissions {
  @override
  final bool canAddMembers;

  @override
  final bool canRemoveMembers;

  @override
  final bool canDeleteBand;

  @override
  final bool canModifySetlists;

  PermissionsModel({
    bool? canAddMembers,
    bool? canRemoveMembers,
    bool? canDeleteBand,
    bool? canModifySetlists,
  })  : canAddMembers = canAddMembers ?? false,
        canRemoveMembers = canRemoveMembers ?? false,
        canDeleteBand = canDeleteBand ?? false,
        canModifySetlists = canModifySetlists ?? false;

  factory PermissionsModel.fromEntity(Permissions entity) => PermissionsModel(
        canAddMembers: entity.canAddMembers,
        canRemoveMembers: entity.canRemoveMembers,
        canDeleteBand: entity.canDeleteBand,
      );

  factory PermissionsModel.fromJson(Map<String, dynamic> json) => _$PermissionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionsModelToJson(this);
}

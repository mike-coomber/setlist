class Permissions {
  final bool canAddMembers;
  final bool canRemoveMembers;
  final bool canDeleteBand;

  Permissions({
    bool? canAddMembers,
    bool? canRemoveMembers,
    bool? canDeleteBand,
  })  : canAddMembers = canAddMembers ?? false,
        canRemoveMembers = canRemoveMembers ?? false,
        canDeleteBand = canDeleteBand ?? false;
}

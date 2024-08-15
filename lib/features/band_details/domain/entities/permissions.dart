class Permissions {
  final bool canAddMembers;
  final bool canRemoveMembers;
  final bool canDeleteBand;
  final bool canModifySetlists;

  Permissions({
    bool? canAddMembers,
    bool? canRemoveMembers,
    bool? canDeleteBand,
    bool? canCreateSetlists,
  })  : canAddMembers = canAddMembers ?? false,
        canRemoveMembers = canRemoveMembers ?? false,
        canDeleteBand = canDeleteBand ?? false,
        canModifySetlists = canCreateSetlists ?? false;
}

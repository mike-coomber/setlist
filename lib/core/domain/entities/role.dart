class Role {
  final String name;
  final Permissions permissions;

  Role.founder()
      : name = 'Founder',
        permissions = Permissions(
          canAddMembers: true,
          canRemoveMembers: true,
          canDeleteBand: true,
        );

  Role.member()
      : name = 'Member',
        permissions = Permissions();
}

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

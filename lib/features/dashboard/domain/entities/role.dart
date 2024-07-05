class Role {
  final String name;
  final Permissions permissions;

  Role.founder()
      : name = 'Founder',
        permissions = Permissions(
          canAddMembers: true,
          canRemoveMembers: true,
        );

  Role.member()
      : name = 'Member',
        permissions = Permissions(
          canAddMembers: false,
          canRemoveMembers: false,
        );
}

class Permissions {
  final bool canAddMembers;
  final bool canRemoveMembers;

  Permissions({required this.canAddMembers, required this.canRemoveMembers});
}

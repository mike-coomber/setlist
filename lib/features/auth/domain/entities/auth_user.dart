class AuthUser {
  final String? name;

  final String id;

  final String email;

  final String? profilePictureUrl;

  const AuthUser({
    required this.id,
    required this.email,
    this.name,
    this.profilePictureUrl,
  });

  static const AuthUser empty = AuthUser(id: '', email: '');
}

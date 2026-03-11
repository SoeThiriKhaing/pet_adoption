class UserEntity {
  final String id;
  final String email;
  final String name;
  final String? profileUrl;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.profileUrl,
  });
}

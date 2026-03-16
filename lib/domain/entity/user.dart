class UserEntity {
  final String id;
  final String email;
  final String userName;
  final String? profileUrl;

  UserEntity({
    required this.id,
    required this.email,
    required this.userName,
    this.profileUrl,
  });
}

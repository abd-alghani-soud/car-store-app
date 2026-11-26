class ProfileEntity {
  final int userId;
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String role;
  final DateTime? createdAt;

  ProfileEntity({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    required this.role,
    required this.createdAt,
  });
}

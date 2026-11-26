import 'package:car_store_app/features/profile/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  final int userId;
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String role;
  final DateTime? createdAt;

  ProfileModel({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    required this.role,
    this.createdAt,
  }) : super(
         userId: userId,
         fullName: fullName,
         email: email,
         phone: phone,
         address: address,
         role: role,
         createdAt: createdAt,
       );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final createdAtRaw = json['createdAt'];
    DateTime? parsedDate;
    if (createdAtRaw is String && createdAtRaw.isNotEmpty) {
      parsedDate = DateTime.tryParse(createdAtRaw);
    }

    return ProfileModel(
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      fullName: json['fullName']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
      createdAt: parsedDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'role': role,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}

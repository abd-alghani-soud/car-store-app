import 'package:car_store_app/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  final String token;
  final String message;
  final String role;

  LoginModel({required this.token, required this.message, required this.role})
    : super(token: token, message: message, role: role);

  // استقبال البيانات من الـ JSON (قادمة من استجابة السيرفر)
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'] ?? '',
      message: json['message'] ?? '',
      role: json['role'] ?? '',
    );
  }

  // تحويل البيانات إلى JSON
  Map<String, dynamic> toJson() {
    return {'token': token, 'message': message, 'role': role};
  }
}

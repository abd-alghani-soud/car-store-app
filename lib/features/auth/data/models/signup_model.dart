import 'package:car_store_app/features/auth/domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  final String message;
  final int userId;

  SignupModel({required this.message, required this.userId})
    : super(message: message, userId: userId);

  // استقبال البيانات من الـ JSON (قادمة من الـ API)
  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      message: json['message'] ?? '',
      userId: json['userId'] ?? 0,
    );
  }

  // تحويل البيانات إلى JSON (إذا احتجت لإرسالها للسيرفر)
  Map<String, dynamic> toJson() {
    return {'message': message, 'userId': userId};
  }
}

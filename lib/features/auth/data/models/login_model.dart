class LoginModel {
  final String token;
  final String message;
  final String role;

  const LoginModel({
    required this.token,
    required this.message,
    required this.role,
  });

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
    return {
      'token': token,
      'message': message,
      'role': role,
    };
  }
}
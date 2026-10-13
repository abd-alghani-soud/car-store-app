class RegisterModel {
  final String message;
  final int userId;

  const RegisterModel({
    required this.message,
    required this.userId,
  });

  // استقبال البيانات من الـ JSON (قادمة من الـ API)
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      message: json['message'] ?? '',
      userId: json['userId'] ?? 0,
    );
  }

  // تحويل البيانات إلى JSON (إذا احتجت لإرسالها للسيرفر)
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
    };
  }
}
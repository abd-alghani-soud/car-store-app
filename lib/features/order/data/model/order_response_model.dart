import 'package:car_store_app/features/order/domain/entities/order_response_entity.dart';

class OrderResponseModel extends OrderResponseEntity {
  final String message;
  final int id;

  OrderResponseModel({required this.message, required this.id})
    : super(message: message, id: id);

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderResponseModel(
      message: json['message'] ?? '',
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'id': id};
  }
}

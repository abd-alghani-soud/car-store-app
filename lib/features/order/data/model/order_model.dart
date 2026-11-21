import '../../domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  final int orderId;
  String? carName;
  final int userId;
  final int sellerId;
  final int carId;
  final String orderType;
  final String orderStatus;
  final num totalPrice;
  final String? userNotes;
  final String? adminNotes;
  final DateTime createdAt;
  final List<String> documentUrls;
  final dynamic rentDetails;
  final dynamic installmentDetails;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.sellerId,
    required this.carId,
    this.carName,
    required this.orderType,
    required this.orderStatus,
    required this.totalPrice,
    this.userNotes,
    this.adminNotes,
    required this.createdAt,
    required this.documentUrls,
    this.rentDetails,
    this.installmentDetails,
  }) : super(
         orderType: orderType,
         createdAt: createdAt,
         orderStatus: orderStatus,
         totalPrice: totalPrice,
         orderId: orderId,
         userId: userId,
         carId: carId,
         adminNotes: adminNotes,
       );


  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'] ?? 0,
      userId: json['userId'] ?? 0,
      sellerId: json['sellerId'] ?? 0,
      carId: json['carId'] ?? 0,
      orderType: json['orderType'] ?? '',
      orderStatus: json['orderStatus'] ?? '',
      totalPrice: json['totalPrice'] ?? 0,
      userNotes: json['userNotes'],
      adminNotes: json['adminNotes'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      documentUrls: json['documentUrls'] != null
          ? List<String>.from(json['documentUrls'])
          : [],
      rentDetails: json['rentDetails'],
      installmentDetails: json['installmentDetails'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'userId': userId,
      'sellerId': sellerId,
      'carId': carId,
      'orderType': orderType,
      'orderStatus': orderStatus,
      'totalPrice': totalPrice,
      'userNotes': userNotes,
      'adminNotes': adminNotes,
      'createdAt': createdAt.toIso8601String(),
      'documentUrls': documentUrls,
      'rentDetails': rentDetails,
      'installmentDetails': installmentDetails,
    };
  }
}

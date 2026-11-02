class OrderEntity {
  final int orderId;
  final int userId;
  final int carId;
  final String? adminNotes;
  final String orderType;
  final DateTime createdAt;
  final String orderStatus;
  final num totalPrice;

  OrderEntity({
    required this.orderType,
    required this.createdAt,
    required this.orderStatus,
    required this.totalPrice,
    required this.orderId,
    required this.userId,
    required this.carId,
    required this.adminNotes,
  });
}

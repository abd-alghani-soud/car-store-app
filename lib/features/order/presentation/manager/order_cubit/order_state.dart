part of 'order_cubit.dart';

@immutable
class OrderState extends Equatable {
  final StatusEnum? buyOrderStatus;
  final StatusEnum? rentOrderStatus;
  final StatusEnum? installmentOrderStatus;
  final StatusEnum? cancelOrderStatus;
  final StatusEnum? getMyOrderStatus;
  final List<OrderEntity>? myOrders;
  final String? errMessage;
  final OrderResponseEntity? responseEntity;

  OrderState({
    this.buyOrderStatus = StatusEnum.initial,
    this.rentOrderStatus = StatusEnum.initial,
    this.installmentOrderStatus = StatusEnum.initial,
    this.cancelOrderStatus = StatusEnum.initial,
    this.getMyOrderStatus = StatusEnum.initial,
    this.myOrders= const [],
    this.errMessage,
    this.responseEntity,
  });

  @override
  List<Object?> get props => [
    buyOrderStatus,
    rentOrderStatus,
    installmentOrderStatus,
    cancelOrderStatus,
    getMyOrderStatus,
    errMessage,
    myOrders,
    responseEntity,
  ];

  OrderState copyWith({
    StatusEnum? buyOrderStatus,
    StatusEnum? rentOrderStatus,
    StatusEnum? installmentOrderStatus,
    StatusEnum? cancelOrderStatus,
    StatusEnum? getMyOrderStatus,
    List<OrderEntity>? myOrders,
    String? errMessage,
    OrderResponseEntity? responseEntity,
  }) {
    return OrderState(
      buyOrderStatus: buyOrderStatus ?? this.buyOrderStatus,
      rentOrderStatus: rentOrderStatus ?? this.rentOrderStatus,
      installmentOrderStatus:
          installmentOrderStatus ?? this.installmentOrderStatus,
      cancelOrderStatus: cancelOrderStatus ?? this.cancelOrderStatus,
      getMyOrderStatus: getMyOrderStatus ?? this.getMyOrderStatus,
      myOrders: myOrders ?? this.myOrders,
      errMessage: errMessage ?? this.errMessage,
      responseEntity: responseEntity ?? this.responseEntity,
    );
  }
}

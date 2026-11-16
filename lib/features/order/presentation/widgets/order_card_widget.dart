import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/services/dependecies.dart';
import 'package:car_store_app/features/order/domain/entities/order_entity.dart';
import 'package:car_store_app/features/order/presentation/manager/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/component/function/show_snackbar.dart';
import '../../../../core/constants/my_color.dart';

class OrderCardWidget extends StatefulWidget {
  const OrderCardWidget({super.key, required this.order});

  final OrderEntity? order;

  @override
  State<OrderCardWidget> createState() => _OrderCardWidgetState();
}

class _OrderCardWidgetState extends State<OrderCardWidget> {
  late OrderCubit _orderCubit;

  @override
  void initState() {
    _orderCubit = getIt<OrderCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (widget.order!.orderStatus) {
      case 'Approved':
        statusColor = Colors.green;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        break;
      case 'Canceled':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.blue;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.order!.carName!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyColor.textPrimary,
                ),
              ),
              BlocConsumer<OrderCubit, OrderState>(
                bloc: _orderCubit,
                listener: (context, state) {
                  if (state.cancelOrderStatus == StatusEnum.success) {
                    _orderCubit.resetState();
                    showSnackBar(
                      message: 'Order cancelled successfully',
                      icon: Icons.offline_pin_outlined,
                      iconColor: Colors.green,
                      context: context,
                    );
                    _orderCubit.getMyOrder();
                  }
                  if (state.cancelOrderStatus == StatusEnum.failure) {
                    showSnackBar(
                      message: state.errMessage ?? 'something went wrong!',
                      icon: Icons.cancel_outlined,
                      iconColor: Colors.red,
                      context: context,
                    );
                  }
                },
                builder: (context, state) {
                  if (state.cancelOrderStatus == StatusEnum.success ||
                      state.cancelOrderStatus == StatusEnum.initial ||
                      state.cancelOrderStatus == StatusEnum.failure) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.order!.orderStatus,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Type: ${widget.order?.orderType}",
            style: TextStyle(color: MyColor.textSecondary, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            "Date: ${widget.order?.createdAt}",
            style: TextStyle(color: MyColor.textSecondary, fontSize: 13),
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.order!.totalPrice.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyColor.accentBlue,
                  fontSize: 14,
                ),
              ),
              widget.order!.orderStatus != 'Canceled'
                  ? TextButton(
                      onPressed: () {
                        _orderCubit.cancelOrder(widget.order!.orderId);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

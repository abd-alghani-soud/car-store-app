import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/widgets/error_message_widget.dart';
import 'package:car_store_app/core/widgets/loading_widget.dart';
import 'package:car_store_app/features/order/presentation/manager/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/dependecies.dart';
import 'order_card_widget.dart';

class MyOrderPageBody extends StatefulWidget {
  const MyOrderPageBody({super.key});

  @override
  State<MyOrderPageBody> createState() => _MyOrderPageBodyState();
}

class _MyOrderPageBodyState extends State<MyOrderPageBody> {
  late final OrderCubit _orderCubit;

  @override
  void initState() {
    super.initState();
    _orderCubit = getIt<OrderCubit>();
    _orderCubit.getMyOrder();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      bloc: _orderCubit,
      builder: (context, state) {
        final order = state.myOrders ?? [];
        if (state.getMyOrderStatus == StatusEnum.success) {
          if (order.isEmpty) {
            return Center(
              child: Text(
                'You have not placed any orders yet !',
                style: TextStyle(color: MyColor.textPrimary, fontSize: 18),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: order.length,
            itemBuilder: (context, index) {
              return OrderCardWidget(order: order[index], onViewDetails: () {});
            },
          );
        }
        if (state.getMyOrderStatus == StatusEnum.loading) {
          return LoadingWidget();
        }
        if (state.getMyOrderStatus == StatusEnum.failure) {
          return Center(
            child: ErrorMessageWidget(messageError: state.errMessage!),
          );
        }
        return SizedBox(height: 400);
      },
    );
  }
}

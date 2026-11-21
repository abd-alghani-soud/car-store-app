import 'package:car_store_app/core/enums/order_type.dart';
import 'package:car_store_app/features/order/presentation/widgets/order_form_content_widget.dart';
import 'package:car_store_app/features/order/presentation/widgets/order_type_selector_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/dependecies.dart';
import '../manager/order_cubit/order_cubit.dart';

class OrdersPageBody extends StatefulWidget {
  const OrdersPageBody({super.key, required this.carId});

  final int carId;

  @override
  State<OrdersPageBody> createState() => _OrdersPageBodyState();
}

class _OrdersPageBodyState extends State<OrdersPageBody> {
  OrderType selectedType = OrderType.rent;
  late final OrderCubit _orderCubit;

  @override
  void initState() {
    super.initState();
    _orderCubit = getIt<OrderCubit>();
    _orderCubit.resetState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          OrderTypeSelectorWidget(
            selectedType: selectedType,
            onTypeSelected: (type) {
              setState(() {
                selectedType = type;
              });
            },
          ),
          const SizedBox(height: 24),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: OrderFormContentWidget(
                selectedType: selectedType,
                carId: widget.carId,
                orderCubit: _orderCubit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

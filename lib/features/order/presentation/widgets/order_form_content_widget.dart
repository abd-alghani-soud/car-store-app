import 'package:flutter/material.dart';
import '../../../../core/enums/order_type.dart';
import '../manager/order_cubit/order_cubit.dart';
import 'buy_form_widget.dart';
import 'installment_form_widget.dart';
import 'rent_form_widget.dart';

class OrderFormContentWidget extends StatelessWidget {
  final OrderType selectedType;
  final int carId;
  final OrderCubit orderCubit;

  const OrderFormContentWidget({
    super.key,
    required this.selectedType,
    required this.carId,
    required this.orderCubit,
  });

  @override
  Widget build(BuildContext context) {
    switch (selectedType) {
      case OrderType.rent:
        return RentFormWidget(
          carId: carId,
          orderCubit: orderCubit,
          key: const ValueKey('RentForm'),
        );
      case OrderType.buy:
        return BuyFormWidget(
          carId: carId,
          orderCubit: orderCubit,
          key: const ValueKey('BuyForm'),
        );
      case OrderType.installment:
        return InstallmentFormWidget(
          carId: carId,
          orderCubit: orderCubit,
          key: const ValueKey('InstallmentForm'),
        );
    }
  }
}

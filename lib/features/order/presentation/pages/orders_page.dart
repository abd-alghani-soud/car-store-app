import 'package:car_store_app/features/order/presentation/widgets/orders_page_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/my_color.dart';

enum OrderType { rent, buy, installment }

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key, required this.carId});
  final int carId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      appBar: AppBar(
        backgroundColor: MyColor.cardColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: MyColor.textPrimary,
            size: 18,
          ),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text(
          "Order",
          style: TextStyle(
            color: MyColor.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: OrdersPageBody(carId: carId,),
    );
  }
}

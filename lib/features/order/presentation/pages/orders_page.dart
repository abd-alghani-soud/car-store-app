import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/order/presentation/widgets/orders_page_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      appBar: AppBar(
        backgroundColor: MyColor.cardColor,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: MyColor.textPrimary,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Order',
          style: TextStyle(
            color: MyColor.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: OrdersPageBody(),
    );
  }
}

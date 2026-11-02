import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';
import 'order_card_widget.dart';

class MyOrderPageBody extends StatelessWidget {
  const MyOrderPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List myOrders = [
      {
        'carName': 'skoda octavia 2008',
        'orderType': 'Rent',
        'status': 'Pending',
        'date': '2026-10-24',
        'price': '45\$/day',
      },
      {
        'carName': 'Daewoo cielo 2008',
        'orderType': 'Installment',
        'status': 'Approved',
        'date': '2026-10-24',
        'price': '45\$/day',
      },
      {
        'carName': 'Bmw 2008',
        'orderType': 'Buy',
        'status': 'Completed',
        'date': '2026-10-24',
        'price': '45\$/day',
      },
    ];
    return myOrders.isEmpty
        ? Center(
            child: Text(
              'You have not placed any orders yet !',
              style: TextStyle(color: MyColor.textPrimary, fontSize: 18),
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: myOrders.length,
            itemBuilder: (context, index) {
              final order = myOrders[index];
              return OrderCardWidget(order: order, onViewDetails: () {});
            },
          );
  }
}

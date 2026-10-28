import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

class OrdersPageBody extends StatelessWidget {
  const OrdersPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              MainButton(
                width: 100,
                borderRadius: BorderRadius.circular(18),
                text: 'Rent',
                fontSize: 12,
                height: 45,
                color: MyColor.cardColor,
                textColor: MyColor.textPrimary,
                onPressed: () {},
              ),
              MainButton(
                width: 100,
                borderRadius: BorderRadius.circular(18),
                text: 'Rent',
                height: 45,
                fontSize: 12,
                color: MyColor.cardColor,
                textColor: MyColor.textPrimary,
                onPressed: () {},
              ),
              MainButton(
                width: 100,
                borderRadius: BorderRadius.circular(18),
                fontSize: 12,
                text: 'Rent',
                height: 45,
                color: MyColor.cardColor,
                textColor: MyColor.textPrimary,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

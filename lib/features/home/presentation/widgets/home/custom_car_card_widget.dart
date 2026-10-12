import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/home/presentation/pages/all_cars_page.dart';
import 'package:car_store_app/features/home/presentation/widgets/common/car_card_widget.dart';
import 'package:flutter/material.dart';

class CustomCarCardWidget extends StatelessWidget {
  CustomCarCardWidget({super.key});

  final sampleCar = {
    "name": "Maserati 867",
    "brand": "Maserati",
    "price": 54,
    "rating": 4.8,
    "reviews": 150,
    "transmission": "Automatic",
    "image": "assets/images/random/ii.png",
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "All Cars",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyColor.textPrimary,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AllCarsPage()),
                );
              },
              child: const Text(
                "View All",
                style: TextStyle(
                  fontSize: 14,
                  color: MyColor.accentBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        CarCardWidget(car: sampleCar, margin: EdgeInsets.zero),
      ],
    );
  }
}

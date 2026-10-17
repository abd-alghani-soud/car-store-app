import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';

class CarDescriptionWidget extends StatelessWidget {
  final String carName;

  const CarDescriptionWidget({
    super.key,
    required this.carName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: MyColor.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Experience the ultimate luxury and performance with this $carName. Designed for both comfort and speed, it offers state-of-the-art features, exceptional handling, and an unforgettable driving experience.",
          style: const TextStyle(
            fontSize: 14,
            color: MyColor.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';

class CarInfoHeaderWidget extends StatelessWidget {
  final String brand;
  final String name;
  final double rating;

  const CarInfoHeaderWidget({
    super.key,
    required this.brand,
    required this.name,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              brand,
              style: const TextStyle(
                fontSize: 14,
                color: MyColor.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: MyColor.textPrimary,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: MyColor.accentBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.star, color: MyColor.goldRating, size: 16),
              const SizedBox(width: 4),
              Text(
                "$rating",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: MyColor.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

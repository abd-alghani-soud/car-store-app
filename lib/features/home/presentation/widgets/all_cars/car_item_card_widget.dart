import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/home/presentation/pages/car_details_page.dart';
import 'package:flutter/material.dart';

class CarItemCardWidget extends StatelessWidget {
  final Map<String, dynamic> car;

  const CarItemCardWidget({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsPage(carData: car),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: MyColor.cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Center(
                  child: Image.asset(
                    car["image"],
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: MyColor.accentBlue.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: MyColor.accentBlue,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  car["name"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyColor.textPrimary,
                  ),
                ),
                Text(
                  car["transmission"],
                  style: const TextStyle(
                    fontSize: 12,
                    color: MyColor.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: MyColor.goldRating, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      "${car["rating"]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: MyColor.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "(${car["reviews"]} Reviews)",
                      style: const TextStyle(color: MyColor.textSecondary, fontSize: 12),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "\$${car["price"]}",
                        style: const TextStyle(
                          color: MyColor.accentBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const TextSpan(
                        text: " / day",
                        style: TextStyle(color: MyColor.textSecondary, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

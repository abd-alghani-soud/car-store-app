import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/home/presentation/pages/car_details_page.dart';
import 'package:flutter/material.dart';

class CarCardWidget extends StatelessWidget {
  final Map<String, dynamic> car;
  final EdgeInsetsGeometry? margin;

  const CarCardWidget({
    super.key,
    required this.car,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final String imagePath = car["image"] ?? 'assets/images/random/ii.png';
    debugPrint('=== CarCardWidget Image Path: $imagePath ===');
    final bool isNetworkImage = imagePath.startsWith('http');

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
        margin: margin ?? const EdgeInsets.only(bottom: 16),
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
                  child: isNetworkImage
                      ? Image.network(
                          imagePath,
                          height: 140,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            debugPrint('=== Image.network Error: $error ===');
                            return Image.asset(
                              'assets/images/random/ii.png',
                              height: 140,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          imagePath,
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
                  car["name"] ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyColor.textPrimary,
                  ),
                ),
                Text(
                  car["transmission"] ?? "Automatic",
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
                      "${car["rating"] ?? 4.8}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: MyColor.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "(${car["reviews"] ?? 150} Reviews)",
                      style: const TextStyle(color: MyColor.textSecondary, fontSize: 12),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "\$${car["price"] ?? 54}",
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

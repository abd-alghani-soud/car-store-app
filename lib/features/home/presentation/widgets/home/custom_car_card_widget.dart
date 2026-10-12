import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/home/presentation/pages/all_cars_page.dart';
import 'package:car_store_app/features/home/presentation/pages/car_details_page.dart';
import 'package:flutter/material.dart';

class CustomCarCardWidget extends StatelessWidget {
  const CustomCarCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleCar = {
      "name": "Maserati 867",
      "brand": "Maserati",
      "price": 54,
      "rating": 4.8,
      "reviews": 150,
      "transmission": "Automatic",
      "image": "assets/images/random/ii.png",
    };

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
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CarDetailsPage(carData: sampleCar),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: MyColor.cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
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
                        'assets/images/random/ii.png',
                        height: 150,
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
                        Icons.favorite,
                        color: MyColor.accentBlue,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Maserati 867",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MyColor.textPrimary,
                      ),
                    ),
                    Text(
                      "Automatic",
                      style: TextStyle(
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
                      children: const [
                        Icon(Icons.star, color: MyColor.goldRating, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "4.8",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: MyColor.textPrimary,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "(150 Reviews)",
                          style: TextStyle(color: MyColor.textSecondary, fontSize: 12),
                        ),
                      ],
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "\$54",
                            style: TextStyle(
                              color: MyColor.accentBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
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
        ),
      ],
    );
  }
}

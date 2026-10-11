import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';

class TopBrandsWidget extends StatelessWidget {
  const TopBrandsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = [
      {"name": "BMW"},
      {"name": "Mercedes"},
      {"name": "Porsche"},
      {"name": "Ferrari"},
      {"name": "Scoda"},
      {"name": "Matiz"},
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Top Brands",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyColor.textPrimary,
              ),
            ),
            Text(
              "View All",
              style: TextStyle(
                fontSize: 14,
                color: MyColor.accentBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return Container(
                width: 75,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  color: MyColor.cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                        brands[index]["image"] ?? "",
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.directions_car, size: 24, color: MyColor.primaryColor),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      brands[index]["name"]!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: MyColor.textPrimary,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

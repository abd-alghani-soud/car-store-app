import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';

class TopBrandsPage extends StatelessWidget {
  const TopBrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> brands = [
      {"name": "BMW", "models": 18, "icon": Icons.directions_car},
      {"name": "Mercedes", "models": 24, "icon": Icons.directions_car_filled},
      {"name": "Porsche", "models": 12, "icon": Icons.directions_car},
      {"name": "Ferrari", "models": 8, "icon": Icons.local_taxi},
      {"name": "Skoda", "models": 10, "icon": Icons.car_rental},
      {"name": "Audi", "models": 15, "icon": Icons.car_repair},
      {"name": "Lamborghini", "models": 6, "icon": Icons.electric_car},
      {"name": "Tesla", "models": 14, "icon": Icons.bolt},
      {"name": "Matiz", "models": 5, "icon": Icons.directions_car},
    ];

    return Scaffold(
      backgroundColor: MyColor.background,
      appBar: AppBar(
        backgroundColor: MyColor.cardColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: MyColor.textPrimary, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Top Brands",
          style: TextStyle(
            color: MyColor.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: brands.length,
        itemBuilder: (context, index) {
          final brand = brands[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: MyColor.cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: MyColor.accentBlue.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    brand["icon"] as IconData,
                    color: MyColor.accentBlue,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  brand["name"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyColor.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${brand["models"]} Models Available",
                  style: const TextStyle(
                    fontSize: 12,
                    color: MyColor.textSecondary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

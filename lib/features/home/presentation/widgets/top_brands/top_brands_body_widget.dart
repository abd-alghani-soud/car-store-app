import 'package:car_store_app/features/home/presentation/widgets/top_brands/brand_item_card_widget.dart';
import 'package:flutter/material.dart';

class TopBrandsBodyWidget extends StatelessWidget {
  TopBrandsBodyWidget({super.key});

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

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: brands.length,
      itemBuilder: (context, index) {
        return BrandItemCardWidget(brand: brands[index]);
      },
    );
  }
}

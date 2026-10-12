import 'package:car_store_app/features/home/presentation/widgets/car_details/car_description_widget.dart';
import 'package:car_store_app/features/home/presentation/widgets/car_details/car_image_header_widget.dart';
import 'package:car_store_app/features/home/presentation/widgets/car_details/car_info_header_widget.dart';
import 'package:car_store_app/features/home/presentation/widgets/car_details/car_specs_grid_widget.dart';
import 'package:flutter/material.dart';

class CarDetailsBodyWidget extends StatelessWidget {
  final Map<String, dynamic> carData;

  const CarDetailsBodyWidget({
    super.key,
    required this.carData,
  });

  @override
  Widget build(BuildContext context) {
    final String name = carData["name"] ?? "Maserati 867";
    final String brand = carData["brand"] ?? "Maserati";
    final double rating = carData["rating"] ?? 4.8;
    final String transmission = carData["transmission"] ?? "Automatic";
    final String image = carData["image"] ?? "assets/images/random/ii.png";

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarImageHeaderWidget(imagePath: image),
          const SizedBox(height: 24),
          CarInfoHeaderWidget(brand: brand, name: name, rating: rating),
          const SizedBox(height: 20),
          CarSpecsGridWidget(transmission: transmission),
          const SizedBox(height: 24),
          CarDescriptionWidget(carName: name),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

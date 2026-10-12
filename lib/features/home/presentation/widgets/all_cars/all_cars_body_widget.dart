import 'package:car_store_app/features/home/presentation/widgets/all_cars/car_category_filter_widget.dart';
import 'package:car_store_app/features/home/presentation/widgets/all_cars/car_item_card_widget.dart';
import 'package:flutter/material.dart';

class AllCarsBodyWidget extends StatelessWidget {
  AllCarsBodyWidget({super.key});

  final List<Map<String, dynamic>> _cars = [
    {
      "name": "Maserati 867",
      "brand": "Maserati",
      "price": 54,
      "rating": 4.8,
      "reviews": 150,
      "transmission": "Automatic",
      "image": "assets/images/random/ii.png",
    },
    {
      "name": "BMW M4 Competition",
      "brand": "BMW",
      "price": 85,
      "rating": 4.9,
      "reviews": 210,
      "transmission": "Automatic",
      "image": "assets/images/random/ii.png",
    },
    {
      "name": "Mercedes AMG GT",
      "brand": "Mercedes",
      "price": 95,
      "rating": 4.9,
      "reviews": 185,
      "transmission": "Automatic",
      "image": "assets/images/random/ii.png",
    },
    {
      "name": "Porsche 911 Carrera",
      "brand": "Porsche",
      "price": 120,
      "rating": 5.0,
      "reviews": 320,
      "transmission": "Automatic",
      "image": "assets/images/random/ii.png",
    },
    {
      "name": "Ferrari F8 Tributo",
      "brand": "Ferrari",
      "price": 250,
      "rating": 4.9,
      "reviews": 95,
      "transmission": "Automatic",
      "image": "assets/images/random/ii.png",
    },
    {
      "name": "Audi R8 V10",
      "brand": "Audi",
      "price": 110,
      "rating": 4.8,
      "reviews": 140,
      "transmission": "Automatic",
      "image": "assets/images/random/ii.png",
    },
  ];

  final ValueNotifier<String> _selectedCategoryNotifier = ValueNotifier<String>("All");
  final List<String> _categories = ["All", "BMW", "Mercedes", "Porsche", "Ferrari", "Audi", "Maserati"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        ValueListenableBuilder<String>(
          valueListenable: _selectedCategoryNotifier,
          builder: (context, selectedCategory, child) {
            return CarCategoryFilterWidget(
              categories: _categories,
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                _selectedCategoryNotifier.value = category;
              },
            );
          },
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ValueListenableBuilder<String>(
            valueListenable: _selectedCategoryNotifier,
            builder: (context, selectedCategory, child) {
              final filteredCars = selectedCategory == "All"
                  ? _cars
                  : _cars.where((car) => car["brand"] == selectedCategory).toList();

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: filteredCars.length,
                itemBuilder: (context, index) {
                  return CarItemCardWidget(car: filteredCars[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';

class AllCarsPage extends StatefulWidget {
  const AllCarsPage({super.key});

  @override
  State<AllCarsPage> createState() => _AllCarsPageState();
}

class _AllCarsPageState extends State<AllCarsPage> {
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

  String _selectedCategory = "All";
  final List<String> _categories = ["All", "BMW", "Mercedes", "Porsche", "Ferrari", "Audi", "Maserati"];

  @override
  Widget build(BuildContext context) {
    final filteredCars = _selectedCategory == "All"
        ? _cars
        : _cars.where((car) => car["brand"] == _selectedCategory).toList();

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
          "All Cars",
          style: TextStyle(
            color: MyColor.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          // Category Filter Chips
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category == _selectedCategory;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? MyColor.accentBlue : MyColor.cardColor,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? Colors.white : MyColor.textPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredCars.length,
              itemBuilder: (context, index) {
                final car = filteredCars[index];
                return Container(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

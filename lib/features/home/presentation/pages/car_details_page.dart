import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/widgets/main_button.dart';
import 'package:car_store_app/features/home/presentation/widgets/car_details/car_details_body_widget.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  final Map<String, dynamic> carData;

  const CarDetailsPage({
    super.key,
    required this.carData,
  });

  @override
  Widget build(BuildContext context) {
    final String name = carData["name"] ?? "Maserati 867";
    final int price = carData["price"] ?? 54;

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
        title: Text(
          name,
          style: const TextStyle(
            color: MyColor.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: MyColor.accentBlue),
            onPressed: () {},
          ),
        ],
      ),
      body: CarDetailsBodyWidget(carData: carData),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: MyColor.cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Price",
                  style: TextStyle(color: MyColor.textSecondary, fontSize: 12),
                ),
                const SizedBox(height: 2),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "\$$price",
                        style: const TextStyle(
                          color: MyColor.accentBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const TextSpan(
                        text: " / day",
                        style: TextStyle(color: MyColor.textSecondary, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 160,
              child: MainButton(
                text: "Book Now",
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Successfully booked $name!"),
                      backgroundColor: MyColor.accentBlue,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

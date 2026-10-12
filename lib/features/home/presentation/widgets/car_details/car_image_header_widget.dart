import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';

class CarImageHeaderWidget extends StatelessWidget {
  final String imagePath;

  const CarImageHeaderWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColor.cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          height: 180,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

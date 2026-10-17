import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';

class BrandItemCardWidget extends StatelessWidget {
  final Map<String, dynamic> brand;

  const BrandItemCardWidget({
    super.key,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}

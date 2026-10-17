import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';

class TopBrandItemWidget extends StatelessWidget {
  final Map<String, dynamic> brand;

  const TopBrandItemWidget({
    super.key,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
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
              brand["image"] ?? "",
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.directions_car, size: 24, color: MyColor.primaryColor),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            brand["name"]!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: MyColor.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

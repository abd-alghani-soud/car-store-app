import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/widgets/main_text_field.dart';
import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyColor.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text.rich(
            TextSpan(
              text: "Select or search your\n",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: MyColor.textPrimary,
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: "favourite vehicle",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyColor.accentBlue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: MainTextField(
                  hint: "Search",
                  fillColor: MyColor.inputFill,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                  prefixIcon: const Icon(Icons.search, color: MyColor.textSecondary, size: 20),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: MyColor.accentBlue,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.tune, color: Colors.white, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

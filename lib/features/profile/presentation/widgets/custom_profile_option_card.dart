import 'package:flutter/material.dart';
import '../../../../core/constants/my_color.dart';

class CustomProfileOptionCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? textColor;

  const CustomProfileOptionCard({
    required this.title,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = textColor ?? MyColor.textPrimary;

    return Material(
      color: MyColor.inputFill,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(color: color, fontSize: 15)),
              Icon(Icons.arrow_forward_ios_sharp, size: 16, color: color),
            ],
          ),
        ),
      ),
    );
  }
}

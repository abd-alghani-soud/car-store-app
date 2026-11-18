import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';

class CustomDateTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const CustomDateTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: subtitle.contains("click")
              ? MyColor.textSecondary
              : MyColor.accentBlue,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(icon, color: Colors.blue),
      onTap: onTap,
    );
  }
}

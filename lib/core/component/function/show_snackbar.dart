import 'package:flutter/material.dart';
import '../../constants/my_color.dart';

void showSnackBar({
  required String message,
  required IconData icon,
  required Color iconColor,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: MyColor.background,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 300,
              child: Text(
                message,
                style: TextStyle(color: MyColor.textPrimary),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(icon, color: iconColor),
          ],
        ),
      ),
    );
}

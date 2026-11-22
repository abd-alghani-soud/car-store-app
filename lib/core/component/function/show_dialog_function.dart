import 'package:flutter/material.dart';
import '../../constants/my_color.dart';
import '../../widgets/main_button.dart';

Future<bool?> showDialogFunction(
  BuildContext context, {
  required String title,
  required String content,
  String cancelButton = 'cancel',
  String confirmButton = 'confirm',
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
        content: Text(content),
        backgroundColor: MyColor.background,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainButton(
                width: 120,
                height: 50,
                fontSize: 10,
                text: cancelButton,
                color: Color(0xFFF3F4F6),
                textColor: MyColor.textPrimary,
                borderRadius: BorderRadius.circular(18),
                onPressed: () {
                  Navigator.of(dialogContext).pop(false);
                },
              ),
              MainButton(
                width: 120,
                height: 50,
                text: confirmButton,
                fontSize: 10,
                color: Colors.red.withOpacity(0.40),
                textColor: Colors.red,
                borderRadius: BorderRadius.circular(18),
                onPressed: () {
                  Navigator.of(dialogContext).pop(true);
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}

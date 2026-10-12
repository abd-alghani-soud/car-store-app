import 'package:flutter/material.dart';
import '../../../../core/constants/my_color.dart';

class CustomTextFromFiled extends StatelessWidget {
  const CustomTextFromFiled({
    super.key,
    required this.hintText,
    required this.prefixIcon,
  });

  final String hintText;
  final Widget prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: MyColor.borderColor,
          hintText: hintText,
          hintStyle: TextStyle(color: MyColor.borderColor),
          filled: true,
          fillColor: MyColor.inputFill,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.borderColor),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

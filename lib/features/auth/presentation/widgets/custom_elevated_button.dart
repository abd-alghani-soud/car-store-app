import 'package:flutter/material.dart';
import '../../../../core/constants/my_color.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 335,
        child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(
          backgroundColor: MyColor.accentBlue,
        ), child: Text('LogIn',style: TextStyle(color: MyColor.background),)));
  }
}

import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/auth/presentation/widgets/signup_page_body.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      body: SignupPageBody(),
    );
  }
}

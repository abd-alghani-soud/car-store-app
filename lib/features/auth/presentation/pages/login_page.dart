import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/auth/presentation/widgets/login_page_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      body: LoginPageBody(),
    );
  }
}

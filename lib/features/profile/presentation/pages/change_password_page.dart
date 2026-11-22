import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/profile/presentation/widgets/change_password_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      body: ChangePasswordBody(),
      appBar: AppBar(
        backgroundColor: MyColor.cardColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: MyColor.textPrimary,
            size: 18,
          ),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text(
          "Change password",
          style: TextStyle(
            color: MyColor.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

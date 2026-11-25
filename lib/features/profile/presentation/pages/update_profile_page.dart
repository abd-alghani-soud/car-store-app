import 'package:car_store_app/features/profile/presentation/widgets/update_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/my_color.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
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
          "Update Profile",
          style: TextStyle(
            color: MyColor.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: UpdateProfileBody(),
    );
  }
}

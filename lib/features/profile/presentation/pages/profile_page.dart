import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/profile/presentation/widgets/profile_page_body.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      body: ProfilePageBody(),
    );
  }
}

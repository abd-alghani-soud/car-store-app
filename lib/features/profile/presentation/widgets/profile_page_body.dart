import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/component/function/show_dialog_function.dart';
import 'custom_profile_option_card.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(22),
      child: Column(
        children: [
          const SizedBox(height: 80),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/random/istockphoto-1300845620-612x612.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'MOHAMMED BAHAA',
            style: TextStyle(
              color: MyColor.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'bahaamarstawi@gmail.com',
            style: TextStyle(color: MyColor.textSecondary, fontSize: 14),
          ),
          const SizedBox(height: 24),
          CustomProfileOptionCard(
            title: 'Change Password',
            onTap: () {
              GoRouter.of(context).push(AppRoute.kChangePasswordPage);
            },
          ),
          const SizedBox(height: 16),
          CustomProfileOptionCard(
            title: 'Update Profile',
            onTap: () {
              GoRouter.of(context).push(AppRoute.kUpdateProfilePage);
            },
          ),
          const SizedBox(height: 16),
          CustomProfileOptionCard(
            title: 'Delete account',
            textColor: Colors.red,
            onTap: () async {
              final confirmed = await showDialogFunction(
                context,
                title: 'Delete Account',
                confirmButton: 'Delete',
                content:
                    'Are you sure you want to delete your account? This action cannot be undone.',
              );
              if (confirmed == true) {}
            },
          ),
        ],
      ),
    );
  }
}

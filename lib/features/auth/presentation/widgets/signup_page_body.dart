import 'package:car_store_app/features/auth/presentation/widgets/signup_form_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/my_color.dart';

class SignupPageBody extends StatelessWidget {
  const SignupPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            SizedBox(height: 120),
            Text(
              'Create New Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyColor.textPrimary,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Set Up Your UserName And Password\n You Can Always Change It Later',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: MyColor.textSecondary),
            ),
            SizedBox(height: 30),
            SignupFormSection(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have on account? ',
                  style: TextStyle(color: MyColor.textPrimary, fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(color: MyColor.accentBlue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
